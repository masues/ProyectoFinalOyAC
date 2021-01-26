library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ccr is
	Port (  selflags : in STD_LOGIC_vector(3 downto 0);
			  nupa : in STD_LOGIC;
			  zupa : in STD_LOGIC;
			  vupa : in STD_LOGIC;
			  cupa : in STD_LOGIC;
			  hupa : in STD_LOGIC;
			  n : out STD_LOGIC;
			  z : out STD_LOGIC;
			  v : out STD_LOGIC;
			  c : out STD_LOGIC;
			  h : out STD_LOGIC;
			  i : out STD_LOGIC
			  );
end ccr;

architecture Behavioral of ccr is
signal ni : std_logic := '0';
signal zi : std_logic := '0';
signal vi : std_logic := '0';
signal ci : std_logic := '0';
signal hi : std_logic := '0';
signal ii : std_logic := '0';

begin
	process (selflags, nupa,zupa,vupa,cupa,hupa, ni, zi, vi, ci, hi, ii)
	begin		
		if selflags = "0000" then
			ni <= ni;
			zi <= zi;
			vi <= vi;
			ci <= ci;
			hi <= hi;
			ii <= ii;
		elsif selflags = "0001" then
			ni <= nupa;
			zi <= zupa;
			vi <= '0';
		elsif selflags = "0010" then
			ni <= nupa;
			zi <= zupa;
			vi <= vupa;
			ci <= cupa;
			hi <= hupa;
		elsif selflags = "0011" then
			ni <= nupa;
			zi <= zupa;
			vi <= vupa;
			ci <= cupa;
		elsif selflags = "0100" then
			zi <= zupa;
		elsif selflags = "0101" then
			ci <= '0';
		elsif selflags = "0110" then
			ii <= '0';
		elsif selflags = "0111" then
			vi <= '0';
		elsif selflags = "1000" then
			ci <= '1';
		elsif selflags = "1001" then
			ii <= '1';
		elsif selflags = "1010" then
			vi <= '1';
		elsif selflags = "1011" then
			ni <= nupa;
			zi <= zupa;
			vi <= '0';
			ci <= '1';
		elsif selflags = "1100" then
			ni <= nupa;
			zi <= zupa;
			vi <= vupa;
		else 
			ni <= ni;
			zi <= zi;
			vi <= vi;
			ci <= ci;
			hi <= hi;
			ii <= ii;
		end if;
	end process;
	
	process (ni,zi,vi,ci,hi,ii)
	begin
		n <= ni;
		z <= zi;
		v <= vi;
		c <= ci;
		h <= hi;
		i <= ii;  
	end process;
end Behavioral;