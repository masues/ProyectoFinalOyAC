library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_dir is
	Port (  sel : in STD_LOGIC_VECTOR(1 downto 0);
			  E0 : in STD_LOGIC_VECTOR(15 downto 0);
			  E1 : in STD_LOGIC_VECTOR(15 downto 0);
			  E2 : in STD_LOGIC_VECTOR(15 downto 0);
			  sal  : out STD_LOGIC_VECTOR(15 downto 0));
end mux_dir;

architecture Behavioral of mux_dir is
begin
	process (sel, E0, E1, E2)
	begin		
		CASE sel IS
		  WHEN "00" => sal <= E0;
		  WHEN "01" => sal <= E1;
		  WHEN "10" => sal <= E2;
		  WHEN "11" => sal <= (others => '0');
		  WHEN OTHERS => sal <= (others => '0');
		END CASE;
	end process;
end Behavioral;