library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity incrementador is
	Port (  entrada : in STD_LOGIC_VECTOR(15 downto 0);
			  salida  : out STD_LOGIC_VECTOR(15 downto 0));
end incrementador;

architecture Behavioral of incrementador is
begin
	process (entrada)
	begin		
		salida <= entrada + 1;
	end process;
end Behavioral;