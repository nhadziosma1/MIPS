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
												x"8C120024", 
												x"8C110010",
												x"8C120014",
												x"8C14000C",
												x"8C0B0018",
												x"8C090040",
												x"8C0D001C",
												x"02328020",
												x"016D4022",
												x"AD31FFF4",
												x"0114A822",
												x"8C0A0020",
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

