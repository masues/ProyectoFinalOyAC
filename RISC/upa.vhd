library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_misc.ALL;

entity upa is
	Port( selop : in STD_LOGIC_VECTOR (3 downto 0);
	      op1 : in STD_LOGIC_VECTOR (15 downto 0);
			op2 : in STD_LOGIC_VECTOR (15 downto 0);
			acarreo : in STD_LOGIC;
			n : out STD_LOGIC;
			z : out STD_LOGIC;
			v : out STD_LOGIC;
			c : out STD_LOGIC;
			h : out STD_LOGIC;
			result : out STD_LOGIC_VECTOR (15 downto 0));
end upa;

architecture Behavioral of upa is
signal opres : std_logic_vector(16 downto 0) := "00000000000000000";
	begin
		process(selop, op1, op2, acarreo, opres)
		begin
			if selop = "0000" then
				opres <= opres;
			elsif selop = "0001" then
				opres <= ('0' & op1) + ('0' & op2) + acarreo;
			elsif selop = "0010" then
				opres <= ('0' & op1) - ('0' & op2) - not(acarreo);
			elsif selop = "0011" then
				opres <= ('0' & op1) and ('0' & op2);
			elsif selop = "0100" then
				opres <= ('0' & op1) or ('0' & op2);
			elsif selop = "0101" then
				opres <= ('0' & op1) xor ('0' & op2);
			elsif selop = "0110" then
				opres <= (op1 & '0') ;
			elsif selop = "0111" then
				opres <= (op1(0) & op1(15) & op1(15 downto 1));
			elsif selop = "1000" then
				opres <= ('0' & op2) - ('0' & op1) - not(acarreo);
			elsif selop = "1001" then
				opres <= (op1(0) & '0' & op1(15 downto 1));
			elsif selop = "1010" then
				opres <= (op1 & acarreo);
			elsif selop = "1011" then
				opres <= (op1(0) & acarreo & op1(15 downto 1));
			else
				opres <= opres;
			end if;
		end process;
		
		
		process(opres)
		begin
			result <= opres(15 downto 0);
			n <= opres(15);
			z <= not(or_reduce(opres(15 downto 0)));
			v <= opres(16);
			c <= opres(16);
			h <= opres(8);
		end process;
		
end Behavioral;
