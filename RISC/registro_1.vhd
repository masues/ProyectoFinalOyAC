library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro_1 is
	Port (  RELOJ : in STD_LOGIC;
			  RESET : in STD_LOGIC;
			  ENTRADA  : in STD_LOGIC;
			  SALIDA : out STD_LOGIC);
end registro_1;

architecture Behavioral of registro_1 is
signal valor_interno : std_logic := '0';

begin
	process (RELOJ, RESET, ENTRADA)
	begin		
		if RESET = '0' then 
			valor_interno <= '0';
		elsif rising_edge (RELOJ) then
			valor_interno <= ENTRADA;
		end if;
	end process;
	
	process (valor_interno)
	begin
		SALIDA <= valor_interno;
	end process;
end Behavioral;