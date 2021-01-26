-- memoria de solo lectura

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memoria_datos is
	Port( clk : in STD_LOGIC;
			direccion : in STD_LOGIC_VECTOR (15 downto 0);
	      datoW : in STD_LOGIC_VECTOR (15 downto 0);
			memW : in STD_LOGIC;
			datos : out STD_LOGIC_VECTOR (15 downto 0));
end memoria_datos;

architecture Behavioral of memoria_datos is
   type memory is array(0 to 50) of std_logic_vector(15 downto 0);
	signal mem : memory;
		
	begin
	
	process (memW, clk, datoW, mem) 
	begin
		if (falling_edge(clk)) then		
			if (memW = '1') then
				mem(conv_integer(unsigned(direccion))) <= datoW;
			else 
				datos <= mem(conv_integer(unsigned(direccion)));
			end if;
		end if;
	end process;
end Behavioral;
