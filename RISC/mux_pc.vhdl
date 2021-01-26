library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_pc is
	Port (  sel : in STD_LOGIC;
			  E0 : in STD_LOGIC_VECTOR(15 downto 0);
			  E1 : in STD_LOGIC_VECTOR(15 downto 0);
			  sal  : out STD_LOGIC_VECTOR(15 downto 0));
end mux_pc;

architecture Behavioral of mux_pc is
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