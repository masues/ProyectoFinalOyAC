library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_1 is
	Port (  sel : in STD_LOGIC;
			  E0 : in STD_LOGIC;
			  E1 : in STD_LOGIC;
			  sal  : out STD_LOGIC);
end mux_1;

architecture Behavioral of mux_1 is
begin
	process (sel, E0, E1)
	begin		
		if sel = '0' then 
			sal <= E0;
		elsif sel = '1' then 
			sal <= E1;
		end if;
	end process;
end Behavioral;