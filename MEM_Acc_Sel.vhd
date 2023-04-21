----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:34:05 04/18/2023 
-- Design Name: 
-- Module Name:    MEM_Acc_Sel - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MEM_Acc_Sel is
    Port ( CLK : in  STD_LOGIC;
           Mem_WrEn : in  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end MEM_Acc_Sel;

architecture Behavioral of MEM_Acc_Sel is

	component MEM_1024
		port ( addr : STD_LOGIC_VECTOR(31 downto 0);
				 din : STD_LOGIC_VECTOR(31 downto 0);
				 we : STD_LOGIC;
				 clk : STD_LOGIC;
				 dout : STD_LOGIC_VECTOR (31 downto 0)
				 );
				
	end component;
begin

	RAM0: MEM_1024
		port map( din => MEM_DataIn,
					 dout => MEM_DataOut,
					 we => Mem_WrEn,
					 addr => ALU_MEM_Addr,
					 clk => CLK
					 );
	

end Behavioral;

