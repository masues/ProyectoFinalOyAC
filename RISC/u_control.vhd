library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity u_control is
	Port( inst : in STD_LOGIC_VECTOR (15 downto 0);
			selregr : out STD_LOGIC_VECTOR (3 downto 0);
			sels1 : out STD_LOGIC;
			sr : out STD_LOGIC;
			cin : out STD_LOGIC;
			sels2 : out STD_LOGIC;
			seldato : out STD_LOGIC;
			selsrc : out STD_LOGIC_VECTOR (2 downto 0);
			seldir : out STD_LOGIC_VECTOR(1 downto 0);
			selop : out STD_LOGIC_VECTOR (3 downto 0);
			selresult : out STD_LOGIC_VECTOR (1 downto 0);
			selc : out STD_LOGIC;
			cadj : out STD_LOGIC;
			selfalgs : out STD_LOGIC_VECTOR (3 downto 0);
			selbranch : out STD_LOGIC_VECTOR (2 downto 0);
			vf : out STD_LOGIC;
			selregw : out STD_LOGIC_VECTOR (2 downto 0);
			memw : out STD_LOGIC;
			seldirw : out STD_LOGIC_VECTOR (1 downto 0));
end u_control;

architecture Behavioral of u_control is
begin
	process (inst)
	begin	
		case inst is
			when X"00C6" => -- LDAB 
				selregr <= "0000";
				sels1 <= '0';
				sr <= '1';
				cin <= '0';
				sels2 <= '0';
				seldato <= '1';
				selsrc <= "011";
				seldir <= "00";
				selop <= "0100";
				selresult <= "01";
				selc <= '1';
				cadj <= '0';
				selfalgs <= "0001";
				selbranch <= "000";
				vf <= '1';
				selregw <= "100";
				memw <= '0';
				seldirw  <= "00";
			WHEN OTHERS => -- NOP 
				selregr <= "0000";
				sels1 <= '0';
				sr <= '0';
				cin <= '0';
				sels2 <= '0';
				seldato <= '0';
				selsrc <= "000";
				seldir <= "00";
				selop <= "0000";
				selresult <= "00";
				selc <= '0';
				cadj <= '0';
				selfalgs <= "0000";
				selbranch <= "000";
				vf <= '1';
				selregw <= "000";
				memw <= '0';
				seldirw  <= "00"; 				
		end case;
	end process;
end Behavioral;
