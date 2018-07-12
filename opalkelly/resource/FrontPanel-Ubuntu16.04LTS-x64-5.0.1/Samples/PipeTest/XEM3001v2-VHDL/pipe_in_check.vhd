--------------------------------------------------------------------------
-- pipe_in_check.vhd
--
-- Received data and checks against pseudorandom sequence for Pipe In.
--
-- Copyright (c) 2005-2010  Opal Kelly Incorporated
-- $Rev$ $Date$
--------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_misc.all;
use IEEE.std_logic_unsigned.all;
use work.FRONTPANEL.all;
library UNISIM;
use UNISIM.VComponents.all;

entity pipe_in_check is
	port (
		clk           : in  STD_LOGIC;
		reset         : in  STD_LOGIC;
		pipe_in_write : in  STD_LOGIC;
		pipe_in_data  : in  STD_LOGIC_VECTOR(15 downto 0);
		pipe_in_ready : out STD_LOGIC;
		throttle_set  : in  STD_LOGIC;
		throttle_val  : in  STD_LOGIC_VECTOR(31 downto 0);
		mode          : in  STD_LOGIC;     -- 0=Count, 1=LFSR
		error_count   : out STD_LOGIC_VECTOR(31 downto 0)
	);
end pipe_in_check;

architecture arch of pipe_in_check is

	signal lfsr     : STD_LOGIC_VECTOR(63 downto 0);
	signal throttle : STD_LOGIC_VECTOR(31 downto 0);
	signal level    : STD_LOGIC_VECTOR(16 downto 0);
	
	signal errors   : STD_LOGIC_VECTOR(31 downto 0);
	signal state    : STD_LOGIC_VECTOR(1 downto 0);
	
	
begin

error_count   <= errors;
state         <= pipe_in_write & throttle(0);

--------------------------------------------------------------------------
-- LFSR mode signals
--
-- 32-bit: x^32 + x^22 + x^2 + 1
-- lfsr_out_reg[0] <= r[31] ^ r[21] ^ r[1]
--------------------------------------------------------------------------
process (clk) begin
	if rising_edge(clk) then
		if (reset = '1') then
			errors <= x"0000_0000";
			throttle <= throttle_val;
			level <= '0' & x"0000";
			
			if (mode = '1') then
				lfsr  <= x"0D0C0B0A04030201";
			else 
				lfsr  <= x"0000000100000001";
			end if;
			
		else
		
			if (level < 64512) then
				pipe_in_ready <= '1';
			else
				pipe_in_ready <= '0';
			end if;
		
			-- Update our virtual FIFO level.
			case (state) is
				when "00" =>
				
				-- Read : Decrease the FIFO level
				when "01" =>
					if (level > 0) then
						level <= level - '1';
					end if;
				
				-- Write : Increase the FIFO level
				when "10" =>
					if (level < 65535) then
						level <= level + '1';
					end if;
				
				-- Read/Write : No net change
				when "11" =>
				
				when others =>
				
			end case;
			
			
			-- The throttle is a circular register.
			-- 1 enabled read or write this cycle.
			-- 0 disables read or write this cycle.
			-- So a single bit (0x00000001) would lead to 1/32 data rate.
			-- Similarly 0xAAAAAAAA would lead to 1/2 data rate.
			if (throttle_set = '1') then
				throttle <= throttle_val;
			else
				throttle <= throttle(0) & throttle(31 downto 1);
			end if;	
			
			-- Check incoming data for validity
			if (pipe_in_write = '1') then
				if (pipe_in_data(15 downto 0) /= lfsr(15 downto 0)) then
					errors <= errors + 1;
				end if;
			end if;
	
			-- Cycle the LFSR
			if (pipe_in_write = '1') then
				if (mode = '1') then 
					lfsr(31 downto 0)  <= lfsr(30 downto 0) & (lfsr(31) xor lfsr(21) xor lfsr(1));
					lfsr(63 downto 32) <= lfsr(62 downto 32) & (lfsr(63) xor lfsr(53) xor lfsr(33));
				else
					lfsr(31 downto 0)   <= lfsr(31 downto 0) + 1;
					lfsr(63 downto 32)  <= lfsr(63 downto 32) + 1;
				end if;
			end if;
			
		end if;
	end if; 
end process;

end arch;