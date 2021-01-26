library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_src is
	Port (  selsrc : in STD_LOGIC_VECTOR(2 downto 0);
			  D1 : in STD_LOGIC_VECTOR(15 downto 0);
			  D2 : in STD_LOGIC_VECTOR(15 downto 0);
			  D3 : in STD_LOGIC_VECTOR(15 downto 0);
			  D4 : in STD_LOGIC_VECTOR(15 downto 0);
			  D5 : in STD_LOGIC_VECTOR(15 downto 0);
			  OP1  : out STD_LOGIC_VECTOR(15 downto 0);
			  OP2  : out STD_LOGIC_VECTOR(15 downto 0));
end mux_src;

architecture Behavioral of mux_src is
begin
	process (selsrc, D1, D2, D3, D4, D5)
	begin	
		CASE selsrc IS
			WHEN "000" => 
				OP1 <= (others => '0');
				OP2 <= (others => '0');
			WHEN "001" => 
				OP1 <= D1;
				OP2 <= D2;
			WHEN "010" => 
				OP1 <= D1;
				OP2 <= D4;
			WHEN "011" => 
				OP1 <= D1;
				OP2 <= D5;
			WHEN "100" => 
				OP1 <= D4;
				OP2 <= D3;
			WHEN "101" => 
				OP1 <= D2;
				OP2 <= D5;
			WHEN "110" => 
				OP1 <= D2;
				OP2 <= D4;
			WHEN OTHERS => 
				OP1 <= (others => '0');
				OP2 <= (others => '0');
		END CASE;
	end process;
end Behavioral;