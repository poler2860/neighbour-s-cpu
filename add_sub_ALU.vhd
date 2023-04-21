----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:16:27 04/10/2023
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
        Out_1 : out  STD_LOGIC_VECTOR (31 downto 0);
	     Zero : out  STD_LOGIC;
        Cout : out  STD_LOGIC;
        Ovf : out  STD_LOGIC);
end add_sub_ALU;

architecture Behavioral of add_sub_ALU is
SIGNAL temp : STD_LOGIC_VECTOR (32 downto 0); -- vector for calculate Cout. is 33 bit and in msb hold the Cout
--singla to check for Carry out(33rd bit =(MSB)) .

begin
	--We add an extra 0 bit in the front 
	--to avoid problems when doing addition/subtraction.
	process is
	begin
		if Op = "0000" then --add
			temp <=(('0' & A) + ('0' & B)); 
		elsif Op = "0001" then --sub
			temp <=  (('0' & A) - ('0' & B)); 
		end if;
	end process;
	
	--check for overflow occurance.
	--if in addition, A and B have the same sign but Sum has different = Overflow.
	--else if in subtraction, A and B have different sign but Diff has the same sign as B = Overlow.
	--else = no Overflow.
	process is
	begin										
		if((Op = "0000") AND (A(31) = B(31)) AND ( temp(31) /= A(31))) then
			Ovf <= '1';
		elsif ((Op = "0001") AND (A(31)/= B(31)) AND ( temp(31) = B(31))) then 
			Ovf <= '1';
		else 
			Ovf <='0';
		end if;
	end process;
	
	--If sum/diff = 0 , zero=1 else zero=0.
	process is 
	begin
		if temp = "000000000000000000000000000000000" then
			Zero <= '1';
		else
			Zero <='0';
		end if;
	end process;
	--finaly add Carry out.
	Cout <= temp(32);
	Out_1 <= temp(31 downto 0); --return the result to Out_1

end Behavioral;
