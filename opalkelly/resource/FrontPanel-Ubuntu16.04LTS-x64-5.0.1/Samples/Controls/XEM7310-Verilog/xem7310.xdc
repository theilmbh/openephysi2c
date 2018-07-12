############################################################################
# XEM7310 - Xilinx constraints file
#
# Pin mappings for the XEM7310.  Use this as a template and comment out 
# the pins that are not used in your design.  (By default, map will fail
# if this file contains constraints for signals not in your design).
#
# Copyright (c) 2004-2016 Opal Kelly Incorporated
############################################################################

set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS True [current_design]

############################################################################
## FrontPanel Host Interface
############################################################################
set_property PACKAGE_PIN Y19 [get_ports {okHU[0]}]
set_property PACKAGE_PIN R18 [get_ports {okHU[1]}]
set_property PACKAGE_PIN R16 [get_ports {okHU[2]}]
set_property SLEW FAST [get_ports {okHU[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {okHU[*]}]

set_property PACKAGE_PIN W19 [get_ports {okUH[0]}]
set_property PACKAGE_PIN V18 [get_ports {okUH[1]}]
set_property PACKAGE_PIN U17 [get_ports {okUH[2]}]
set_property PACKAGE_PIN W17 [get_ports {okUH[3]}]
set_property PACKAGE_PIN T19 [get_ports {okUH[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {okUH[*]}]

set_property PACKAGE_PIN AB22 [get_ports {okUHU[0]}]
set_property PACKAGE_PIN AB21 [get_ports {okUHU[1]}]
set_property PACKAGE_PIN Y22 [get_ports {okUHU[2]}]
set_property PACKAGE_PIN AA21 [get_ports {okUHU[3]}]
set_property PACKAGE_PIN AA20 [get_ports {okUHU[4]}]
set_property PACKAGE_PIN W22 [get_ports {okUHU[5]}]
set_property PACKAGE_PIN W21 [get_ports {okUHU[6]}]
set_property PACKAGE_PIN T20 [get_ports {okUHU[7]}]
set_property PACKAGE_PIN R19 [get_ports {okUHU[8]}]
set_property PACKAGE_PIN P19 [get_ports {okUHU[9]}]
set_property PACKAGE_PIN U21 [get_ports {okUHU[10]}]
set_property PACKAGE_PIN T21 [get_ports {okUHU[11]}]
set_property PACKAGE_PIN R21 [get_ports {okUHU[12]}]
set_property PACKAGE_PIN P21 [get_ports {okUHU[13]}]
set_property PACKAGE_PIN R22 [get_ports {okUHU[14]}]
set_property PACKAGE_PIN P22 [get_ports {okUHU[15]}]
set_property PACKAGE_PIN R14 [get_ports {okUHU[16]}]
set_property PACKAGE_PIN W20 [get_ports {okUHU[17]}]
set_property PACKAGE_PIN Y21 [get_ports {okUHU[18]}]
set_property PACKAGE_PIN P17 [get_ports {okUHU[19]}]
set_property PACKAGE_PIN U20 [get_ports {okUHU[20]}]
set_property PACKAGE_PIN N17 [get_ports {okUHU[21]}]
set_property PACKAGE_PIN N14 [get_ports {okUHU[22]}]
set_property PACKAGE_PIN V20 [get_ports {okUHU[23]}]
set_property PACKAGE_PIN P16 [get_ports {okUHU[24]}]
set_property PACKAGE_PIN T18 [get_ports {okUHU[25]}]
set_property PACKAGE_PIN V19 [get_ports {okUHU[26]}]
set_property PACKAGE_PIN AB20 [get_ports {okUHU[27]}]
set_property PACKAGE_PIN P15 [get_ports {okUHU[28]}]
set_property PACKAGE_PIN V22 [get_ports {okUHU[29]}]
set_property PACKAGE_PIN U18 [get_ports {okUHU[30]}]
set_property PACKAGE_PIN AB18 [get_ports {okUHU[31]}]
set_property SLEW FAST [get_ports {okUHU[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {okUHU[*]}]

set_property PACKAGE_PIN N13 [get_ports {okAA}]
set_property IOSTANDARD LVCMOS18 [get_ports {okAA}]


create_clock -name okUH0 -period 9.920 [get_ports {okUH[0]}]

set_input_delay -add_delay -max -clock [get_clocks {okUH0}]  8.000 [get_ports {okUH[*]}]
set_input_delay -add_delay -min -clock [get_clocks {okUH0}] 10.000 [get_ports {okUH[*]}]
set_multicycle_path -setup -from [get_ports {okUH[*]}] 2

set_input_delay -add_delay -max -clock [get_clocks {okUH0}]  8.000 [get_ports {okUHU[*]}]
set_input_delay -add_delay -min -clock [get_clocks {okUH0}]  2.000 [get_ports {okUHU[*]}]
set_multicycle_path -setup -from [get_ports {okUHU[*]}] 2

set_output_delay -add_delay -max -clock [get_clocks {okUH0}]  2.000 [get_ports {okHU[*]}]
set_output_delay -add_delay -min -clock [get_clocks {okUH0}]  -0.500 [get_ports {okHU[*]}]

set_output_delay -add_delay -max -clock [get_clocks {okUH0}]  2.000 [get_ports {okUHU[*]}]
set_output_delay -add_delay -min -clock [get_clocks {okUH0}]  -0.500 [get_ports {okUHU[*]}]


############################################################################
## System Clock
############################################################################
set_property IOSTANDARD LVDS_25 [get_ports {sys_clkp}]
set_property PACKAGE_PIN W11 [get_ports {sys_clkp}]

set_property IOSTANDARD LVDS_25 [get_ports {sys_clkn}]
set_property PACKAGE_PIN W12 [get_ports {sys_clkn}]

create_clock -name sys_clk -period 5 [get_ports sys_clkp]
set_clock_groups -asynchronous -group [get_clocks {sys_clk}] -group [get_clocks {mmcm0_clk0 okUH0}]

# MC1-15 
set_property PACKAGE_PIN W9 [get_ports {xbusp[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[0]}]

# MC1-16 
set_property PACKAGE_PIN V9 [get_ports {xbusp[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[1]}]

# MC1-17 
set_property PACKAGE_PIN Y9 [get_ports {xbusn[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[0]}]

# MC1-18 
set_property PACKAGE_PIN V8 [get_ports {xbusn[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[1]}]

# MC1-19 
set_property PACKAGE_PIN R6 [get_ports {xbusp[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[2]}]

# MC1-20 
set_property PACKAGE_PIN V7 [get_ports {xbusp[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[3]}]

# MC1-21 
set_property PACKAGE_PIN T6 [get_ports {xbusn[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[2]}]

# MC1-22 
set_property PACKAGE_PIN W7 [get_ports {xbusn[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[3]}]

# MC1-23 
set_property PACKAGE_PIN U6 [get_ports {xbusp[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[4]}]

# MC1-24 
set_property PACKAGE_PIN Y8 [get_ports {xbusp[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[5]}]

# MC1-25 
set_property PACKAGE_PIN V5 [get_ports {xbusn[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[4]}]

# MC1-26 
set_property PACKAGE_PIN Y7 [get_ports {xbusn[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[5]}]

# MC1-27 
set_property PACKAGE_PIN T5 [get_ports {xbusp[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[6]}]

# MC1-28 
set_property PACKAGE_PIN W6 [get_ports {xbusp[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[7]}]

# MC1-29 
set_property PACKAGE_PIN U5 [get_ports {xbusn[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[6]}]

# MC1-30 
set_property PACKAGE_PIN W5 [get_ports {xbusn[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[7]}]

# MC1-31 
set_property PACKAGE_PIN AA5 [get_ports {xbusp[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[8]}]

# MC1-32 
set_property PACKAGE_PIN R4 [get_ports {xbusp[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[9]}]

# MC1-33 
set_property PACKAGE_PIN AB5 [get_ports {xbusn[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[8]}]

# MC1-34 
set_property PACKAGE_PIN T4 [get_ports {xbusn[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[9]}]

# MC1-37 
set_property PACKAGE_PIN AB7 [get_ports {xbusp[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[10]}]

# MC1-38 
set_property PACKAGE_PIN Y4 [get_ports {xbusp[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[11]}]

# MC1-39 
set_property PACKAGE_PIN AB6 [get_ports {xbusn[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[10]}]

# MC1-40 
set_property PACKAGE_PIN AA4 [get_ports {xbusn[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[11]}]

# MC1-41 
set_property PACKAGE_PIN R3 [get_ports {xbusp[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[12]}]

# MC1-42 
set_property PACKAGE_PIN Y6 [get_ports {xbusp[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[13]}]

# MC1-43 
set_property PACKAGE_PIN R2 [get_ports {xbusn[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[12]}]

# MC1-44 
set_property PACKAGE_PIN AA6 [get_ports {xbusn[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[13]}]

# MC1-45 
set_property PACKAGE_PIN Y3 [get_ports {xbusp[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[14]}]

# MC1-46 
set_property PACKAGE_PIN AA8 [get_ports {xbusp[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[15]}]

# MC1-47 
set_property PACKAGE_PIN AA3 [get_ports {xbusn[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[14]}]

# MC1-48 
set_property PACKAGE_PIN AB8 [get_ports {xbusn[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[15]}]

# MC1-49 
set_property PACKAGE_PIN U2 [get_ports {xbusp[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[16]}]

# MC1-50 
set_property PACKAGE_PIN U3 [get_ports {xbusp[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[17]}]

# MC1-51 
set_property PACKAGE_PIN V2 [get_ports {xbusn[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[16]}]

# MC1-52 
set_property PACKAGE_PIN V3 [get_ports {xbusn[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[17]}]

# MC1-53 
set_property PACKAGE_PIN W2 [get_ports {xbusp[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[18]}]

# MC1-54 
set_property PACKAGE_PIN W1 [get_ports {xbusp[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[19]}]

# MC1-57 
set_property PACKAGE_PIN Y2 [get_ports {xbusn[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[18]}]

# MC1-58 
set_property PACKAGE_PIN Y1 [get_ports {xbusn[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[19]}]

# MC1-59 
set_property PACKAGE_PIN T1 [get_ports {xbusp[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[20]}]

# MC1-60 
set_property PACKAGE_PIN AB3 [get_ports {xbusp[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[21]}]

# MC1-61 
set_property PACKAGE_PIN U1 [get_ports {xbusn[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[20]}]

# MC1-62 
set_property PACKAGE_PIN AB2 [get_ports {xbusn[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[21]}]

# MC1-63 
set_property PACKAGE_PIN AA1 [get_ports {xbusp[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[22]}]

# MC1-64 
set_property PACKAGE_PIN Y13 [get_ports {xbusp[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[23]}]

# MC1-65 
set_property PACKAGE_PIN AB1 [get_ports {xbusn[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[22]}]

# MC1-66 
set_property PACKAGE_PIN AA14 [get_ports {xbusn[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[23]}]

# MC1-67 
set_property PACKAGE_PIN AB16 [get_ports {xbusp[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[24]}]

# MC1-68 
set_property PACKAGE_PIN AA13 [get_ports {xbusp[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[25]}]

# MC1-69 
set_property PACKAGE_PIN AB17 [get_ports {xbusn[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[24]}]

# MC1-70 
set_property PACKAGE_PIN AB13 [get_ports {xbusn[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[25]}]

# MC1-71 
set_property PACKAGE_PIN AA15 [get_ports {xbusp[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[26]}]

# MC1-72 
set_property PACKAGE_PIN W15 [get_ports {xbusp[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[27]}]

# MC1-73 
set_property PACKAGE_PIN AB15 [get_ports {xbusn[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[26]}]

# MC1-74 
set_property PACKAGE_PIN W16 [get_ports {xbusn[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[27]}]

# MC1-75 
set_property PACKAGE_PIN Y16 [get_ports {xbusp[28]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[28]}]

# MC1-76 
set_property PACKAGE_PIN AA16 [get_ports {xbusn[28]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[28]}]

# MC1-77 
set_property PACKAGE_PIN V4 [get_ports {xbusp[29]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusp[29]}]

# MC1-79 
set_property PACKAGE_PIN W4 [get_ports {xbusn[29]}]
set_property IOSTANDARD LVCMOS33 [get_ports {xbusn[29]}]

# MC2-15 
set_property PACKAGE_PIN P5 [get_ports {ybusp[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[0]}]

# MC2-16 
set_property PACKAGE_PIN P6 [get_ports {ybusp[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[1]}]

# MC2-17 
set_property PACKAGE_PIN P4 [get_ports {ybusn[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[0]}]

# MC2-18 
set_property PACKAGE_PIN N5 [get_ports {ybusn[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[1]}]

# MC2-19 
set_property PACKAGE_PIN N4 [get_ports {ybusp[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[2]}]

# MC2-20 
set_property PACKAGE_PIN P2 [get_ports {ybusp[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[3]}]

# MC2-21 
set_property PACKAGE_PIN N3 [get_ports {ybusn[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[2]}]

# MC2-22 
set_property PACKAGE_PIN N2 [get_ports {ybusn[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[3]}]

# MC2-23 
set_property PACKAGE_PIN L5 [get_ports {ybusp[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[4]}]

# MC2-24 
set_property PACKAGE_PIN R1 [get_ports {ybusp[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[5]}]

# MC2-25 
set_property PACKAGE_PIN L4 [get_ports {ybusn[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[4]}]

# MC2-26 
set_property PACKAGE_PIN P1 [get_ports {ybusn[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[5]}]

# MC2-27 
set_property PACKAGE_PIN M6 [get_ports {ybusp[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[6]}]

# MC2-28 
set_property PACKAGE_PIN M3 [get_ports {ybusp[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[7]}]

# MC2-29 
set_property PACKAGE_PIN M5 [get_ports {ybusn[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[6]}]

# MC2-30 
set_property PACKAGE_PIN M2 [get_ports {ybusn[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[7]}]

# MC2-31 
set_property PACKAGE_PIN M1 [get_ports {ybusp[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[8]}]

# MC2-32 
set_property PACKAGE_PIN K6 [get_ports {ybusp[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[9]}]

# MC2-33 
set_property PACKAGE_PIN L1 [get_ports {ybusn[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[8]}]

# MC2-34 
set_property PACKAGE_PIN J6 [get_ports {ybusn[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[9]}]

# MC2-37 
set_property PACKAGE_PIN K2 [get_ports {ybusp[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[10]}]

# MC2-38 
set_property PACKAGE_PIN L3 [get_ports {ybusp[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[11]}]

# MC2-39 
set_property PACKAGE_PIN J2 [get_ports {ybusn[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[10]}]

# MC2-40 
set_property PACKAGE_PIN K3 [get_ports {ybusn[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[11]}]

# MC2-41 
set_property PACKAGE_PIN K1 [get_ports {ybusp[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[12]}]

# MC2-42 
set_property PACKAGE_PIN J5 [get_ports {ybusp[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[13]}]

# MC2-43 
set_property PACKAGE_PIN J1 [get_ports {ybusn[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[12]}]

# MC2-44 
set_property PACKAGE_PIN H5 [get_ports {ybusn[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[13]}]

# MC2-45 
set_property PACKAGE_PIN H3 [get_ports {ybusp[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[14]}]

# MC2-46 
set_property PACKAGE_PIN H2 [get_ports {ybusp[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[15]}]

# MC2-47 
set_property PACKAGE_PIN G3 [get_ports {ybusn[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[14]}]

# MC2-48 
set_property PACKAGE_PIN G2 [get_ports {ybusn[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[15]}]

# MC2-49 
set_property PACKAGE_PIN E2 [get_ports {ybusp[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[16]}]

# MC2-50 
set_property PACKAGE_PIN G1 [get_ports {ybusp[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[17]}]

# MC2-51 
set_property PACKAGE_PIN D2 [get_ports {ybusn[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[16]}]

# MC2-52 
set_property PACKAGE_PIN F1 [get_ports {ybusn[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[17]}]

# MC2-53 
set_property PACKAGE_PIN F3 [get_ports {ybusp[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[18]}]

# MC2-54 
set_property PACKAGE_PIN E1 [get_ports {ybusp[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[19]}]

# MC2-57 
set_property PACKAGE_PIN E3 [get_ports {ybusn[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[18]}]

# MC2-58 
set_property PACKAGE_PIN D1 [get_ports {ybusn[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[19]}]

# MC2-59 
set_property PACKAGE_PIN B1 [get_ports {ybusp[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[20]}]

# MC2-60 
set_property PACKAGE_PIN C2 [get_ports {ybusp[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[21]}]

# MC2-61 
set_property PACKAGE_PIN A1 [get_ports {ybusn[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[20]}]

# MC2-62 
set_property PACKAGE_PIN B2 [get_ports {ybusn[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[21]}]

# MC2-63 
set_property PACKAGE_PIN K4 [get_ports {ybusp[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[22]}]

# MC2-64 
set_property PACKAGE_PIN U15 [get_ports {ybusp[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[23]}]

# MC2-65 
set_property PACKAGE_PIN J4 [get_ports {ybusn[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[22]}]

# MC2-66 
set_property PACKAGE_PIN V15 [get_ports {ybusn[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[23]}]

# MC2-67 
set_property PACKAGE_PIN T16 [get_ports {ybusp[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[24]}]

# MC2-68 
set_property PACKAGE_PIN T14 [get_ports {ybusp[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[25]}]

# MC2-69 
set_property PACKAGE_PIN U16 [get_ports {ybusn[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[24]}]

# MC2-70 
set_property PACKAGE_PIN T15 [get_ports {ybusn[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[25]}]

# MC2-71 
set_property PACKAGE_PIN V13 [get_ports {ybusp[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[26]}]

# MC2-72 
set_property PACKAGE_PIN W14 [get_ports {ybusp[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[27]}]

# MC2-73 
set_property PACKAGE_PIN V14 [get_ports {ybusn[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[26]}]

# MC2-74 
set_property PACKAGE_PIN Y14 [get_ports {ybusn[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[27]}]

# MC2-75 
set_property PACKAGE_PIN Y11 [get_ports {ybusp[28]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[28]}]

# MC2-76 
set_property PACKAGE_PIN Y12 [get_ports {ybusn[28]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[28]}]

# MC2-77 
set_property PACKAGE_PIN H4 [get_ports {ybusp[29]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusp[29]}]

# MC2-79 
set_property PACKAGE_PIN G4 [get_ports {ybusn[29]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ybusn[29]}]

# LEDs #####################################################################
set_property PACKAGE_PIN A13 [get_ports {led[0]}]
set_property PACKAGE_PIN B13 [get_ports {led[1]}]
set_property PACKAGE_PIN A14 [get_ports {led[2]}]
set_property PACKAGE_PIN A15 [get_ports {led[3]}]
set_property PACKAGE_PIN B15 [get_ports {led[4]}]
set_property PACKAGE_PIN A16 [get_ports {led[5]}]
set_property PACKAGE_PIN B16 [get_ports {led[6]}]
set_property PACKAGE_PIN B17 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[*]}]
