library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ext_signo is
	Port (  entrada : in STD_LOGIC_VECTOR(7 downto 0);
			  salida  : out STD_LOGIC_VECTOR(15 downto 0));
end ext_signo;

architecture Behavioral of ext_signo is
begin
	process (entrada)
	begin		
		if entrada(7) = '0' then 
			salida <= X"00" & entrada;
		else
			salida <= X"FF" & entrada;
		end if;
	end process;
end Behavioral;