----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:37:51 05/06/2019 
-- Design Name: 
-- Module Name:    MUX2_1 - Behavioral 
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

entity MUX2_1 is
	port(ulaz1 : in std_logic_vector (4 downto 0);
		  ulaz2: in std_logic_vector (4 downto 0);
		  kontrolni: in std_logic;
		  izlaz: out std_logic_vector (4 downto 0)
		  );
end MUX2_1;

architecture Behavioral of MUX2_1 is
begin
-- "IF" SE NE MOZE KORISITI IZVAN PROCESA!!!!!!!!! 
	--if(kontrolni = '0') then
	--izlaz <= ulaz1;
	--else
	--izlaz <= ulaz2;
	--end if;
	
	--II nacin:
	--izlaz <= ulaz1 when kontrolni = '0' else
	--izlaz <= ulaz2;
	--"Type of izlaz is incompatible with type of <=" zato sto "izlaz <=" u drugom redu nije potrebno
	izlaz <= ulaz1 when kontrolni = '0' else
				ulaz2;
				
end Behavioral;

