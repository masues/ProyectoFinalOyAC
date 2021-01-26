library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sumador is
	Port (  sr : in STD_LOGIC;
			  cin : in STD_LOGIC;
			  d1 : in STD_LOGIC_VECTOR(15 downto 0);
			  d2 : in STD_LOGIC_VECTOR(15 downto 0);
			  res  : out STD_LOGIC_VECTOR(15 downto 0));
end sumador;

architecture Behavioral of sumador is
begin
	process (sr, cin, d1, d2)
	begin		
		if sr = '1' then 
			res <= d1 + d2 + cin;
		else 
			res <= d1 - d2 - not(cin);
		end if;
	end process;
end Behavioral;