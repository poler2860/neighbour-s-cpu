----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:59:20 04/17/2023 
-- Design Name: 
-- Module Name:    basic_register - Behavioral 
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

entity basic_register is
    Port ( R_in : in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           R_out : out  STD_LOGIC_VECTOR (31 downto 0));
end basic_register;

architecture Behavioral of basic_register is

begin

	process(CLK, WE, Rin)
	begin
		if rising_edge(CLK) and WE = '1' then
			Rout <= Rin;
		end if;
	end process;

end Behavioral;

