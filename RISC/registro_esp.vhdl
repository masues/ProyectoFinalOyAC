library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro_esp is
	Port (  RELOJ : in STD_LOGIC;
			  RESET : in STD_LOGIC;
			  ENTRADA  : in STD_LOGIC_VECTOR(15 downto 0);
			  WR : in STD_LOGIC;
			  SALIDA : out STD_LOGIC_VECTOR(15 downto 0));
end registro_esp;

architecture Behavioral of registro_esp is
constant zero : std_logic_vector (15 downto 0) := X"0000";
signal valor_interno : std_logic_vector (15 downto 0) := X"0000";

begin
	process (RELOJ, RESET, ENTRADA, WR)
	begin		
		if RESET = '0' then 
			valor_interno <= zero;
		elsif (falling_edge(RELOJ) and WR = '1') then
			valor_interno <= ENTRADA;
		end if;
	end process;
	
	process (valor_interno)
	begin
		SALIDA <= valor_interno;
	end process;
end Behavioral;