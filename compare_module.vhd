----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:19:16 04/17/2023 
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
           result : out  STD_LOGIC_VECTOR (4 downto 0));
end compare_module;

architecture Behavioral of compare_module is

begin
	result <= cmp_0 when cmp_0 = cmp_1 else
				 cmp_1;

end Behavioral;

