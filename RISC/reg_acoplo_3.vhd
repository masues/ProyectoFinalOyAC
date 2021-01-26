library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_acoplo_3 is
	Port (  RELOJ : in STD_LOGIC;
			  RESET : in STD_LOGIC;
			selopi : in STD_LOGIC_VECTOR (3 downto 0);
			selresulti : in STD_LOGIC_VECTOR (1 downto 0);
			selci : in STD_LOGIC;
			cadji : in STD_LOGIC;
			selfalgsi : in STD_LOGIC_VECTOR (3 downto 0);
			selbranchi : in STD_LOGIC_VECTOR (2 downto 0);
			vfi : in STD_LOGIC;
			selregwi : in STD_LOGIC_VECTOR (2 downto 0);
			memwi : in STD_LOGIC;
			seldirwi : in STD_LOGIC_VECTOR (1 downto 0);
			selopo : out STD_LOGIC_VECTOR (3 downto 0);
			selresulto : out STD_LOGIC_VECTOR (1 downto 0);
			selco : out STD_LOGIC;
			cadjo : out STD_LOGIC;
			selfalgso : out STD_LOGIC_VECTOR (3 downto 0);
			selbrancho : out STD_LOGIC_VECTOR (2 downto 0);
			vfo : out STD_LOGIC;
			selregwo : out STD_LOGIC_VECTOR (2 downto 0);
			memwo : out STD_LOGIC;
			seldirwo : out STD_LOGIC_VECTOR (1 downto 0));
end reg_acoplo_3;

architecture Behavioral of reg_acoplo_3 is
constant zero : std_logic_vector (15 downto 0) := X"0000";

signal selop : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal selresult : STD_LOGIC_VECTOR (1 downto 0) := "00";
signal selc : STD_LOGIC := '0';
signal cadj : STD_LOGIC := '0';
signal selfalgs : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal selbranch : STD_LOGIC_VECTOR (2 downto 0) := "000";
signal vf : STD_LOGIC := '1';
signal selregw : STD_LOGIC_VECTOR (2 downto 0) := "000";
signal memw : STD_LOGIC := '0';
signal seldirw : STD_LOGIC_VECTOR (1 downto 0) := "00";

begin
	process (RELOJ, RESET, selopi,selresulti,selci,cadji,selfalgsi,selbranchi,vfi,selregwi,memwi,seldirwi)
	begin		
		if RESET = '0' then 
			selop <= "0000";
			selresult <= "00";
			selc <= '0';
			cadj <= '0';
			selfalgs <= "0000";
			selbranch <= "000";
			vf <= '1';
			selregw <= "000";
			memw <= '0';
			seldirw <= "00";
		elsif rising_edge (RELOJ) then
			selop <= selopi;
			selresult <= selresulti;
			selc <= selci;
			cadj <= cadji;
			selfalgs <= selfalgsi;
			selbranch <= selbranchi;
			vf <= vfi;
			selregw <= selregwi;
			memw <= memwi;
			seldirw <= seldirwi;
		end if;
	end process;
	
	process (selop,selresult,selc,cadj,selfalgs,selbranch,vf,selregw,memw,seldirw)
	begin
		selopo <= selop;
		selresulto <= selresult;
		selco <= selc;
		cadjo <= cadj;
		selfalgso <= selfalgs;
		selbrancho <= selbranch;
		vfo <= vf;
		selregwo <= selregw;
		memwo <= memw;
		seldirwo <= seldirw;
	end process;
end Behavioral;