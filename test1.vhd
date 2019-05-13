
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:26:45 04/29/2019
-- Design Name:   put_podataka
-- Module Name:   C:/Xilinx92i/MIPS_vhdl1/test1.vhd
-- Project Name:  MIPS_vhdl1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: put_podataka
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
--ova biblioteka je dodana
USE ieee.numeric_std.ALL;

ENTITY test1_vhd IS
END test1_vhd;

ARCHITECTURE behavior OF test1_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT put_podataka
	PORT(
		clock : IN std_logic;          
		instrukcija : OUT std_logic_vector(31 downto 0);
		adresa : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL clock :  std_logic := '0';

	--Outputs
	SIGNAL instrukcija :  std_logic_vector(31 downto 0);
	SIGNAL adresa :  std_logic_vector(31 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: put_podataka PORT MAP(
		clock => clock,
		instrukcija => instrukcija,
		adresa => adresa
	);

	tb : PROCESS
	BEGIN

		clock <= '1';
		wait for 100 ns;
		clock <= '0';
		wait for 100 ns;
		clock <= '1';
		wait for 100 ns;
		clock <= '0';
		wait for 100 ns;
		clock <= '1';
		wait for 100 ns;
		clock <= '0';
		wait for 100 ns;		
		wait for 100 ns;
		clock <= '1';
	END PROCESS;

END;
