library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_result is
	Port (  selresult : in STD_LOGIC_VECTOR(1 downto 0);
			  res : in STD_LOGIC_VECTOR(15 downto 0);
			  op1 : in STD_LOGIC_VECTOR(15 downto 0);
			  op2 : in STD_LOGIC_VECTOR(15 downto 0);
			  d3 : in STD_LOGIC_VECTOR(15 downto 0);
			  dirw  : out STD_LOGIC_VECTOR(15 downto 0);
			  datow  : out STD_LOGIC_VECTOR(15 downto 0));
end mux_result;

architecture Behavioral of mux_result is
begin
	process (selresult, res, op1, op2, d3)
	begin		
		CASE selresult IS
			WHEN "00" => 
				dirw <= (others => '0');
				datow <= (others => '0');
			WHEN "01" => 
				dirw <= d3;
				datow <= res;
			WHEN "10" => 
				dirw <= d3;
				datow <= op2;
			WHEN "11" => 
				dirw <= d3;
				datow <= op1;
			WHEN OTHERS => 
				dirw <= (others => '0');
				datow <= (others => '0');
		END CASE;
	end process;
end Behavioral;