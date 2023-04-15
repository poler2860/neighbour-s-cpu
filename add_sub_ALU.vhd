----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:19:03 03/28/2021 
-- Design Name: 
-- Module Name:    add_sub_ALU - Behavioral 
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
use ieee.std_logic_unsigned.all;


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity add_sub_ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
	       Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end add_sub_ALU;

architecture Behavioral of add_sub_ALU is
SIGNAL tmpOut : STD_LOGIC_VECTOR (32 downto 0); -- vector for calculate Cout. is 33 bit and in msb hold the Cout


begin



tmpOut <=   (('0' & A) + ('0' & B)) when Op = "0000" else  -- i join a one more bit('0') for being able to do the add sub commands
            (('0' & A) - ('0' & B)) when Op = "0001" ; 
				
Ovf <= '1' when ((A(31) = B(31)) AND ( tmpOut(31) /= A(31)) AND (Op = "0000") ) else -- add nums with same sign but different sign sum
       '1' when ((A(31)/= B(31)) AND ( tmpOut(31)  = B(31)) AND (Op = "0001") ) else -- sub nums with different sign but the result has the same sign as the subtrahend (5-(-2) = somthing positive)
       '0';		

Zero <= '1' when tmpOut = "000000000000000000000000000000000" else
        '0';		 
			 
Cout <= tmpOut(32);
Output <= tmpOut(31 downto 0); 
 
  

end Behavioral;

