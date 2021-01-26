-- memoria de solo lectura

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memoria_inst is
	Port( direccion : in STD_LOGIC_VECTOR (15 downto 0);
			datos : out STD_LOGIC_VECTOR (31 downto 0));
end memoria_inst;

architecture Behavioral of memoria_inst is
   	
	type memory is array(0 to 50) of std_logic_vector(31 downto 0);
	signal mem : memory;
	
	attribute ram_init_file : string;
   attribute ram_init_file of mem : signal is "mem_prog.mif";
	
	
	begin
	
		datos <= mem(conv_integer(unsigned(direccion)));
		
end Behavioral;
