----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:25:31 04/29/2019 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
port( clk : in std_logic;
		pc_in : in std_logic_vector (31 downto 0);
		pc_out : out std_logic_vector (31 downto 0)
	);
end PC;

architecture Behavioral of PC is
begin
--proces ide poslije "begin-a", i odnose se na varijebale i stvari koje se desavaju na promjenu varijble
	proces1 : process(clk)
	begin
	if(rising_edge(clk)) then
	pc_out <= pc_in;
	end if;
	end process proces1;
end Behavioral;

