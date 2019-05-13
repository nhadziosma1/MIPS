----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:20:16 04/29/2019 
-- Design Name: 
-- Module Name:    PCadder - Behavioral 
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

entity PCadder is

port ( adder_in : in std_logic_vector(31 downto 0);
		adder_out : out std_logic_vector(31 downto 0)
		);
end PCadder;

architecture Behavioral of PCadder is
--signali idu prije "begin-a" i odnose se na lkolakne varijable koje nisu 
	signal cetvorka : std_logic_vector(31 downto 0) := x"00000004";

begin
--"std_logic_vector(...)" sluzi kao konverzija u vektorski tip
	adder_out <= std_logic_vector(adder_in + cetvorka);  

end Behavioral;

