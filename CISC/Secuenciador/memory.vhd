library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memory is
Port ( 
	dir : in STD_LOGIC_VECTOR (11 downto 0);
	data : out STD_LOGIC_VECTOR (93 downto 0));
end memory;

architecture Behavioral of memory is
	type memory is array(0 to 4095) of std_logic_vector(93 downto 0);
	signal mem : memory;
	
	attribute ram_init_file : string;
   attribute ram_init_file of mem : signal is "rom_content.mif";
	
	-- DATA FORMAT
		-- |    PRUEBA    |VF| Ins |                LIGA                 |
		--  P4 P3 P2 P1 P0 VF I1 I0 L11 L10 L9 L8 L7 L6 L5 L4 L3 L2 L1 L0 nCRI EB1 EB0 nWB EA1 EA0 nWA selbus UPA9 UPA8 UPA7 UPA6 UPA5 UPA4 UPA3 UPA2 UPA1 UPA0 nOEUPA nDUPA selmux nEX2 nEX1 nEX0 X2 X1 X0 EnaY nERA2 nERA1 nERA0 RA2 RA1 RA0 nEAP2 nEAP1 nEAP0 AP2 AP1 AP0 nEPC2 nEPC1 nEPC0 PC2 PC1 PC0 nCBD nAS nRW BD DINT HINT SET_IRQ SET_XIRQ B9 B8 B7 B6 B5 B4 B3 B2 B1 B0 CC CN CV CZ CI CH CX CS nHB ACCSEC

		-- Cadena por default: "00000" & "0" & "00" & "000000000000" & "10010010000000000011011100001110001110001110001110000000000000000000000010"

	
	begin
	
		data <= mem(conv_integer(unsigned(dir)));
	
end Behavioral;
