library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_acoplo_4 is
	Port (  RELOJ : in STD_LOGIC;
			  RESET : in STD_LOGIC;
			selregwi : in STD_LOGIC_VECTOR (2 downto 0);
			memwi : in STD_LOGIC;
			seldirwi : in STD_LOGIC_VECTOR (1 downto 0);
			selregwo : out STD_LOGIC_VECTOR (2 downto 0);
			memwo : out STD_LOGIC;
			seldirwo : out STD_LOGIC_VECTOR (1 downto 0));
end reg_acoplo_4;

architecture Behavioral of reg_acoplo_4 is

signal selregw : STD_LOGIC_VECTOR (2 downto 0) := "000";
signal memw : STD_LOGIC := '0';
signal seldirw : STD_LOGIC_VECTOR (1 downto 0) := "00";

begin
	process (RELOJ, RESET, selregwi,memwi,seldirwi)
	begin		
		if RESET = '0' then 
			selregw <= "000";
			memw <= '0';
			seldirw <= "00";
		elsif rising_edge (RELOJ) then
			selregw <= selregwi;
			memw <= memwi;
			seldirw <= seldirwi;
		end if;
	end process;
	
	process (selregw,memw,seldirw)
	begin
		selregwo <= selregw;
		memwo <= memw;
		seldirwo <= seldirw;
	end process;
end Behavioral;