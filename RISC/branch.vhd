library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity branch is
	Port (  selbranch : in STD_LOGIC_VECTOR(2 downto 0);
			  n : in STD_LOGIC;
			  z : in STD_LOGIC;
			  v : in STD_LOGIC;
			  c : in STD_LOGIC;
			  vf : in STD_LOGIC;
			  branch  : out STD_LOGIC);
end branch;

architecture Behavioral of branch is
begin
	process (selbranch, n, z, v, c, vf)
	begin		
		if selbranch = "000" then 
			branch <= vf xnor '0';
		elsif selbranch = "001" then 
			branch <= vf xnor c;
		elsif selbranch = "010" then 
			branch <= vf xnor z;
		elsif selbranch = "011" then 
			branch <= vf xnor (n xor V);
		elsif selbranch = "100" then 
			branch <= vf xnor (z or (n xor v));
		elsif selbranch = "101" then 
			branch <= vf xnor (c or z);
		elsif selbranch = "110" then 
			branch <= vf xnor n;
		elsif selbranch = "111" then 
			branch <= vf xnor v;
		else
			branch <= '0';
		end if;
	end process;
end Behavioral;