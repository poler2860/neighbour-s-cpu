----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:53:06 04/22/2023 
-- Design Name: 
-- Module Name:    compare_module - Behavioral 
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

entity compare_module is
    Port ( cmp_0 : in  STD_LOGIC_VECTOR (4 downto 0);
           cmp_1 : in  STD_LOGIC_VECTOR (4 downto 0);
           result : out  STD_LOGIC);
end compare_module;

architecture Behavioral of compare_module is

begin
	process(cmp_0, cmp_1) is
	begin
	
		if cmp_0 = cmp_1 then 
			result <= '1';
		else 
			result <= '0';
		end if;
	end process;

end Behavioral;

