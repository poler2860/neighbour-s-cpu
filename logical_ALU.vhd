----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    			00:41:41 03/29/2021  
-- Design Name: 
-- Module Name:    logical_ALU - Behavioral 
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

entity logical_ALU is
	Port (A : in  STD_LOGIC_VECTOR (31 downto 0);
        B : in  STD_LOGIC_VECTOR (31 downto 0);
        Op : in  STD_LOGIC_VECTOR (3 downto 0);
		Out_1 : out  STD_LOGIC_VECTOR (31 downto 0);
		Zero : out  STD_LOGIC;
        Cout : out  STD_LOGIC;
        Ovf : out  STD_LOGIC);
                                                      
end logical_ALU;

architecture Behavioral of logical_ALU is

begin

	process(Op)
	begin
		case Op is 
			when "0010" => Out_1 <= (A and B);
			when "0011" => Out_1 <= (A or B);
			when "0100" => Out_1 <= (not A);
			when "0101" => Out_1 <= (A nand B);
			when "0110" => Out_1 <= (A nor B);
		end case;
	end process;	
	
	Zero <= '0';
	Cout <= '0';
	Ovf <= '0';

end Behavioral;

