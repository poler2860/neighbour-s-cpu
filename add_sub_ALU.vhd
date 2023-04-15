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
    Port( A : in  STD_LOGIC_VECTOR (31 downto 0);
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

	MainProc: process(Op) is
	begin
		if Op = "0000" then
			tmpOut <=(('0' & A) + ('0' & B)); -- i join a one more bit('0') for being able to do the add sub commands
		elsif Op = "0001" then
			tmpOut <=  (('0' & A) - ('0' & B)); -- i join a one more bit('0') for being able to do the add sub commands
		end if;
	end process MainProc;
	
	--check for overflow occurance.
	CheckOverflow: process(Op) is
	begin																		
		if((A(31) = B(31)) AND ( tmpOut(31) /= A(31)) AND (Op = "0000") ) then -- add nums with same sign but different sign sum
			Ovf <= '1';
		elsif ((A(31)/= B(31)) AND ( tmpOut(31)  = B(31)) AND (Op = "0001") ) then -- sub nums with different sign but the result has the same sign as the subtrahend (5-(-2) = somthing positive)
			Ovf <= '1';
		else 
			Ovf <='0';
		end if;
	end process CheckOverflow;
	
	CheckZero: process(Op) is 
	begin
		if tmpOut = "000000000000000000000000000000000" then
			Zero <= '1';
		else
			Zero <='0';
		end if
	end process CheckZero;
	
	Cout <= tmpOut(32);
	Output <= tmpOut(31 downto 0); 

end Behavioral;

