library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_dirw is
	Port (  seldirw : in STD_LOGIC_VECTOR(1 downto 0);
			  seldir : in STD_LOGIC_VECTOR(1 downto 0);
			  sel  : out STD_LOGIC_VECTOR(1 downto 0));
end mux_dirw;

architecture Behavioral of mux_dirw is
begin
	process (seldirw, seldir)
	begin		
		if seldirw = "10" then 
			sel <= "10";
		else
			sel <= seldir;
		end if;
	end process;
end Behavioral;