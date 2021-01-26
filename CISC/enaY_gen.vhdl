library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_misc.ALL;

entity enaY_gen is
	Port( edo_pres : in std_logic_vector(11 downto 0); -- Estado Presente
			enaY : in std_logic; -- enaY del secuenciador
			nCSX : out std_logic; 
			nCSY: out std_logic
			);
end enaY_gen;

architecture Behavioral of enaY_gen is
	signal data_out : std_logic := '0';
	signal enaX : std_logic := '0';
	
	begin	
	process (edo_pres) 
	begin
		if ( edo_pres = X"009") then
			enaX <= '1';
		else
			enaX <= '0';
		end if;
	end process;
	
	
	process (enaY, enaX) 
	begin
		if(enaX = '0' and enaY = '0') then -- Manten
			data_out <= data_out;
		elsif(enaX = '0' and enaY = '1') then -- habilita Y
			data_out <= '1';
		elsif(enaX = '1' and enaY = '0') then -- habilita X
			data_out <= '0';
		else
			data_out <= data_out; -- Otros casos Manten
		end if;
	end process;
	
	process (data_out)
	begin
		nCSX <= data_out;
		nCSY <= not(data_out);
	end process;
		
end Behavioral;
