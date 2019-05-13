----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:50:47 04/29/2019 
-- Design Name: 
-- Module Name:    put_podataka - Behavioral 
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

entity put_podataka is
--ovo su ulazi i izlazi iz svih onih komponenti kombinovanih u jednu cjelinu
port (clock : in std_logic;
		instrukcija : out std_logic_vector(31 downto 0);
		adresa : out std_logic_vector(31 downto 0)
		);
end put_podataka;

architecture Behavioral of put_podataka is
--komponente se nabrajaju prije "begin-a"
component PC is
	port( clk : in std_logic;
			pc_in : in std_logic_vector (31 downto 0);
			pc_out : out std_logic_vector (31 downto 0)
		);
end component;

component PCadder is 
	port ( adder_in : in std_logic_vector(31 downto 0);
			adder_out : out std_logic_vector(31 downto 0)
			);
end component;

component mem_instrukcija is
	port ( mem_instr_in : in std_logic_vector (31 downto 0);
			mem_instr_out : out std_logic_vector (31 downto 0)
			);
end component;

component CONTROL
	port (
			opcode: in std_logic_vector(5 downto 0);
			reg_dest,jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write: out std_logic;
			alu_op: out std_logic_vector(1 downto 0)
		);
component end;

component SignExtend
	port(ulaz: in std_logic_vector(15 downto 0),
		  izlaz: out std_logic_vector(31 downto 0)
			);
component end;
	
component REGFILE
	port(clk: in std_logic;
	  RegWrite: in std_logic;
	  regUlaz1: in std_logic_vector(4 downto 0);
	  regUlaz2: in std_logic_vector(4 downto 0);
	  regUlaz3izMuxa: in std_logic_vector(4 downto 0);
	  upisiURegistar: in std_logic_vector(31 downto 0);
	  regIzlaz1: out std_logic_vector(31 downto 0);
	  regIzlaz2: out std_logic_vector(31 downto 0)
	  );
component end;

component MUX2_1
	port(ulaz1 : in std_logic_vector (4 downto 0);
		  ulaz2: in std_logic_vector (4 downto 0);
		  kontrolni: in std_logic;
		  izlaz: out std_logic_vector (4 downto 0)
		  );
component end;

--ova prva varijabla je ulaz u memoriju instrukcija
signal adresa_instrukcije : std_logic_vector(31 downto 0) := x"00000000";
signal sljedeca_adresa : std_logic_vector(31 downto 0) := x"00000000";
-- "vrijednost" jer se radi o immediate vrijednosti
signal prosirena_vrijednost : std_logic_vector (31 downto 0) := x"00000000";

--za lab 6, koristim prefiks "s" da bih prepoznao da se radi o signalu 
signal s_reg_dest : std_logic :='0';
signal s_jump : std_logic :='0';
signal s_branch : std_logic :='0';
signal s_mem_read : std_logic :='0';
signal s_mem_to_reg : std_logic :='0';
signal s_mem_write : std_logic :='0'; 
signal s_alu_src : std_logic :='0';
signal s_reg_write: std_logic :='0';
signal s_alu_op: std_logic_vector(1 downto 0);
--
signal s_rez_muxa : std_logic_vector(4 downto 0) := "00000";
--
signal s_read_data1 : std_logic_vector(31 downto 0);
signal s_read_data2 : std_logic_vector(31 downto 0);
signal s_write_data : std_logic_vector(31 downto 0);

begin
--ovdje ide "adresa", a ne adresa_instrukcije, jer je inace "adres", varijbal "put podataka" bila na simulaciji konstanta
programski_brojac : PC port map (clock, sljedeca_adresa, adresa);
--dok je za razliku od prethodne instrukcije, u ovoj bilo potrebno poslati vec postavljenu vrijednost "adresa instruckije" (mijanja se poslije begin-a)
pc_adder : PCadder port map(adresa_instrukcije, sljedeca_adresa);
memorija_instrukcija : mem_instrukcija port map(adresa_instrukcije, instrukcija);

sgn_ex : SignExtend port map(adresa_instrukcije(15 downto 0), prosirena_vrijednost);
ctrl : CONTROL port map (adresa_instrukcije(31 downto 26), s_reg_dest, s_jump, s_branch, s_mem_read, s_mem_to_reg, s_mem_write, s_alu_src, s_reg_write, s_alu_op);
prvi_mux2x1 : MUX2_1 port map (adresa_instrukcije(15 downto 11), adresa_instrukcije(20 downto 16), s_reg_dest, s_rez_muxa);
--nisam siguran za "clock", ali valjda je tacno
registers : REGFILE port map (clock, s_reg_write, adresa_instrukcije(25 downto 21), asresa_instrukcije(20 downto 16), s_rez_muxa, s_write_data, s_read_data1, s_read_data2);

	process(clock) 
	begin
		if rising_edge(clock) then 
		adresa_instrukcije <= sljedeca_adresa;
		end if;
	end process;

end Behavioral;

