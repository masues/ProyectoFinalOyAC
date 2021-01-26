library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro_inst is
	Port (  RELOJ : in STD_LOGIC;
			  RESET : in STD_LOGIC;
			  ENTRADA  : in STD_LOGIC_VECTOR(31 downto 0);
			  SALIDA15 : out STD_LOGIC_VECTOR(15 downto 0);
			  SALIDA7 : out STD_LOGIC_VECTOR(7 downto 0);
			  SALIDA31 : out STD_LOGIC_VECTOR(15 downto 0));
end registro_inst;

architecture Behavioral of registro_inst is
signal valor_interno : std_logic_vector (31 downto 0) := X"00000000";
constant zero : std_logic_vector (31 downto 0) := X"00000000";

begin
	process (RELOJ, RESET, ENTRADA)
	begin		
		if RESET = '0' then 
			valor_interno <= zero;
		elsif rising_edge (RELOJ) then
			valor_interno <= ENTRADA;
		end if;
	end process;
	
	process (valor_interno)
	begin
		SALIDA15 <= valor_interno(15 downto 0);
		SALIDA7 <= valor_interno(7 downto 0);
		SALIDA31 <= valor_interno(31 downto 16);
	end process;
end Behavioral;