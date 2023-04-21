----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:45:23 04/18/2023 
-- Design Name: 
-- Module Name:    ALU_Sel - Behavioral 
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

entity ALU_Sel is
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_Sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  Zero : out STD_LOGIC;
			  Cout : out STD_LOGIC;
			  Ovf : out STD_LOGIC
			  );
end ALU_Sel;

architecture Behavioral of ALU_Sel is

	component ALU
		port ( Din0 : in STD_LOGIC_VECTOR(31 downto 0);
				 Din1 : STD_LOGIC_VECTOR(31 downto 0);
				 Op : in STD_LOGIC_VECTOR(3 downto 0);
				 Dout : out STD_LOGIC_VECTOR(31 downto 0);
				 f_zero : out STD_LOGIC;
				 f_carry : out STD_LOGIC;
				 f_ovf : out STD_LOGIC
				 );
	end component;
	
	signal second_input : STD_LOGIC_VECTOR(31 downto 0);
	
begin

	second_input <= RF_B when ALU_Bin_Sel = '0' else
						 Immed;
	

	ALU0 : ALU
		port map ( Din0 => RF_A,
					  Din1 => second_input,
					  Op => ALU_func,
					  Dout => ALU_out,
					  f_zero => Zero,
					  f_carry => Cout,
					  f_ovf => OVF
					  );
					  
end Behavioral;

