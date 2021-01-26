library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity u_anticipaciones is
	Port(
		selregr : in STD_LOGIC_VECTOR(3 downto 0);
		selregw : in STD_LOGIC_VECTOR(2 downto 0);
		sela : out STD_LOGIC;
		selb : out STD_LOGIC);
end u_anticipaciones;

architecture Behavioral of u_anticipaciones is
begin
	process (selregr, selregw)
	begin
		case selregr is
			when X"1" =>
				if selregw = X"1" then
					sela <= '1';
					selb <= '0';
				elsif selregw = X"4" then
					sela <= '0';
					selb <= '1';
				else
					sela <= '0';
					selb <= '0';
				end if;
			when X"2" =>
				if selregw = X"4" then
					sela <= '1';
					selb <= '0';
				elsif selregw = X"2" then
					sela <= '0';
					selb <= '1';
				else
					sela <= '0';
					selb <= '0';
				end if;
			when X"3" =>
				if selregw = X"4" then
					sela <= '1';
					selb <= '0';
				elsif selregw = X"3" then
					sela <= '0';
					selb <= '1';
				else
					sela <= '0';
					selb <= '0';
				end if;
			when X"4" =>
				if selregw = X"1" then
					sela <= '1';
					selb <= '0';
				else
					sela <= '0';
					selb <= '0';
				end if;
			when X"5" =>
				if selregw = X"4" then
					sela <= '1';
					selb <= '0';
				else
					sela <= '0';
					selb <= '0';
				end if;
			when X"6" =>
				if selregw = X"1" then
					sela <= '1';
					selb <= '0';
				elsif selregw = X"2" then
					sela <= '0';
					selb <= '1';
				else
					sela <= '0';
					selb <= '0';
				end if;
			when X"7" =>
				if selregw = X"1" then
					sela <= '1';
					selb <= '0';
				elsif selregw = X"3" then
					sela <= '0';
					selb <= '1';
				else
					sela <= '0';
					selb <= '0';
				end if;
			when X"8" =>
				if selregw = X"5" then
					sela <= '1';
					selb <= '0';
				else
					sela <= '0';
					selb <= '0';
				end if;
			when X"9" =>
				if selregw = X"2" then
					sela <= '0';
					selb <= '1';
				else
					sela <= '0';
					selb <= '0';
				end if;
			when X"A" =>
				if selregw = X"3" then
					sela <= '0';
					selb <= '1';
				else
					sela <= '0';
					selb <= '0';
				end if;
			when X"B" =>
				if selregw = X"6" then
					sela <= '0';
					selb <= '1';
				else
					sela <= '0';
					selb <= '0';
				end if;
			when X"C" =>
				if selregw = X"1" then
					sela <= '1';
					selb <= '0';
				elsif selregw = X"6" then
					sela <= '0';
					selb <= '1';
				else
					sela <= '0';
					selb <= '0';
				end if;
			when X"D" =>
				if selregw = X"4" then
					sela <= '1';
					selb <= '0';
				elsif selregw = X"6" then
					sela <= '0';
					selb <= '1';
				else
					sela <= '0';
					selb <= '0';
				end if;
			when X"E" =>
				if selregw = X"2" then
					sela <= '1';
					selb <= '0';
				elsif selregw = X"6" then
					sela <= '0';
					selb <= '1';
				else
					sela <= '0';
					selb <= '0';
				end if;
			when X"F" =>
				if selregw = X"3" then
					sela <= '1';
					selb <= '0';
				elsif selregw = X"6" then
					sela <= '0';
					selb <= '1';
				else
					sela <= '0';
					selb <= '0';
				end if;
			when others =>
				sela <= '0';
				selb <= '0';
		end case;
	end process;
end Behavioral;