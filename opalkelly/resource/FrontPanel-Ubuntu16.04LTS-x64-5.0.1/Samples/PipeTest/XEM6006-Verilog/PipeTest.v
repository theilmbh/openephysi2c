//------------------------------------------------------------------------
// PipeTest.v
//
// This is simple HDL that implements barebones PipeIn and PipeOut 
// functionality.  The logic generates and compares againt a pseudorandom 
// sequence of data as a way to verify transfer integrity and benchmark the pipe 
// transfer speeds.
//
// Copyright (c) 2005-2011  Opal Kelly Incorporated
// $Rev$ $Date$
//------------------------------------------------------------------------
`timescale 1ns / 1ps
`default_nettype none

module PipeTest(
	input  wire [7:0]  hi_in,
	output wire [1:0]  hi_out,
	inout  wire [15:0] hi_inout,
	inout  wire        hi_aa,

	output wire [3:0]  led
	);

// Target interface bus:
wire         ti_clk;
wire [30:0]  ok1;
wire [16:0]  ok2;

// Endpoint connections:
wire [15:0]  ep00wire, throttle_in, throttle_out;
wire [15:0]  rcv_errors;

assign led = ~(rcv_errors[3:0]);

// Pipe In
wire        pipe_in_write;
wire        pipe_in_ready;
wire [15:0] pipe_in_data;
pipe_in_check pic0 (.clk           (ti_clk),
                    .reset         (ep00wire[2]),
                    .pipe_in_write (pipe_in_write),
                    .pipe_in_data  (pipe_in_data),
                    .pipe_in_ready (pipe_in_ready),
                    .throttle_set  (ep00wire[5]),
                    .throttle_val  ({throttle_in, throttle_in}),
                    .mode          (ep00wire[4]),
                    .error_count   (rcv_errors)
                    );

// Pipe Out
wire        pipe_out_read;
wire        pipe_out_ready;
wire [15:0] pipe_out_data;
pipe_out_check poc0 (.clk            (ti_clk),
                     .reset          (ep00wire[2]),
                     .pipe_out_read  (pipe_out_read),
                     .pipe_out_data  (pipe_out_data),
                     .pipe_out_ready (pipe_out_ready),
                     .throttle_set   (ep00wire[5]),
                     .throttle_val   ({throttle_out, throttle_out}),
                     .mode           (ep00wire[4])
                     );
                                          
// Instantiate the okHost and connect endpoints.
// Host interface
okHost okHI(
	.hi_in(hi_in), .hi_out(hi_out), .hi_inout(hi_inout), .hi_aa(hi_aa), .ti_clk(ti_clk),
	.ok1(ok1), .ok2(ok2));

wire [17*3-1:0]  ok2x;
okWireOR # (.N(3)) wireOR (ok2, ok2x);
okWireIn     wi00 (.ok1(ok1),                           .ep_addr(8'h00), .ep_dataout(ep00wire));
okWireIn     wi01 (.ok1(ok1),                           .ep_addr(8'h01), .ep_dataout(throttle_out));
okWireIn     wi02 (.ok1(ok1),                           .ep_addr(8'h02), .ep_dataout(throttle_in));
okWireOut    wo21 (.ok1(ok1), .ok2(ok2x[ 0*17 +: 17 ]), .ep_addr(8'h21), .ep_datain(rcv_errors));
okBTPipeIn   ep80 (.ok1(ok1), .ok2(ok2x[ 1*17 +: 17 ]), .ep_addr(8'h80), .ep_write(pipe_in_write), .ep_blockstrobe(), .ep_dataout(pipe_in_data), .ep_ready(pipe_in_ready));
okBTPipeOut  epA0 (.ok1(ok1), .ok2(ok2x[ 2*17 +: 17 ]), .ep_addr(8'ha0), .ep_read(pipe_out_read),  .ep_blockstrobe(), .ep_datain(pipe_out_data), .ep_ready(pipe_out_ready));

endmodule