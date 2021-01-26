library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity deco_regw is
	Port (  selregw : in STD_LOGIC_VECTOR(2 downto 0);
			  ACCA : out STD_LOGIC;
			  ACCB : out STD_LOGIC;
			  IX : out STD_LOGIC;
			  IY : out STD_LOGIC;
			  SP : out STD_LOGIC;
			  AUX  : out STD_LOGIC);
end deco_regw;

architecture Behavioral of deco_regw is
begin
	process (selregw)
	begin		
		if selregw = "000" then 
			ACCA <= '0';
			ACCB <= '0';
			IX <= '0';
			IY <= '0';
			SP <= '0';
			AUX <= '0';
		elsif selregw = "001" then 
			ACCA <= '1';
			ACCB <= '0';
			IX <= '0';
			IY <= '0';
			SP <= '0';
			AUX <= '0';
		elsif selregw = "010" then 
			ACCA <= '0';
			ACCB <= '0';
			IX <= '1';
			IY <= '0';
			SP <= '0';
			AUX <= '0';
		elsif selregw = "011" then 
			ACCA <= '0';
			ACCB <= '0';
			IX <= '0';
			IY <= '1';
			SP <= '0';
			AUX <= '0';
		elsif selregw = "100" then 
			ACCA <= '0';
			ACCB <= '1';
			IX <= '0';
			IY <= '0';
			SP <= '0';
			AUX <= '0';
		elsif selregw = "101" then 
			ACCA <= '0';
			ACCB <= '0';
			IX <= '0';
			IY <= '0';
			SP <= '0';
			AUX <= '1';
		elsif selregw = "110" then 
			ACCA <= '0';
			ACCB <= '0';
			IX <= '0';
			IY <= '0';
			SP <= '1';
			AUX <= '0';
		else
			ACCA <= '0';
			ACCB <= '0';
			IX <= '0';
			IY <= '0';
			SP <= '0';
			AUX <= '0';
		end if;
	end process;
end Behavioral;