----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:33:28 04/29/2019 
-- Design Name: 
-- Module Name:    memorija_podataka - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--ova je biblioteka dodana da bi se mogao koristit "conv_integer"
use ieee.numeric_std.all;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem_instrukcija is
	port ( mem_instr_in : in std_logic_vector (31 downto 0);
			 mem_instr_out : out std_logic_vector (31 downto 0)
			);
end mem_instrukcija;

architecture Behavioral of mem_instrukcija is
--definicija svog tipa varijable
	type memorija is array (0 to 31) of std_logic_vector(31 downto 0);
	
--definicija lokalne varijable tog tipa
	signal mem_instr : memorija := (
												x"11111110",
												x"11111100",
												x"11111000",
												x"11110000",
												x"22222222",
												x"33333333",
												x"44444444",
												x"55555555",
												x"66666666",
												x"77777777",
												x"88888888",
												x"99999999",
												x"10101010",
												x"12121212",
												x"13131313",
												x"14141414",
												x"15151515",
												x"16161616",
												x"17171717",
												x"18181818",
												x"19191919",
												x"20202020",
												x"21212121",
												x"23232323",
												x"24242424",
												x"25252525",
												x"26262626",
												x"27272727",
												x"28282828",
												x"29292929",
												x"30303030",
												x"31313131"
												);
	
begin
	mem_instr_out <= mem_instr(conv_integer(unsigned(mem_instr_in)));
end Behavioral;

