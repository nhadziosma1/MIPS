----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:27:17 05/06/2019 
-- Design Name: 
-- Module Name:    SignExtend - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- ova biblioteka zakometarisana, jer dovodi do konflikta sa "resize" metodom. Forum:
--a) don't use std_logic_arith ever.
--b) "resize()" is in the "numeric_std" package and works on unsigned and signed. 
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--
use ieee.numeric_std.all;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SignExtend is
	port(ulaz: in std_logic_vector(15 downto 0);
		  izlaz: out std_logic_vector(31 downto 0)
		  );
end SignExtend;

architecture Behavioral of SignExtend is

begin
	--A'LENGTH     is the integer value of the number of elements in array A.
	izlaz <= std_logic_vector(resize(signed(ulaz), izlaz'length));
end Behavioral;

