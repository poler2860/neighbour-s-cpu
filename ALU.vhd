----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:24:02 04/10/2023	old date 21:13:23 03/28/2021 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Out_1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end ALU;

architecture Stractural of ALU is
	SIGNAL asOutput : STD_LOGIC_VECTOR (31 downto 0); --output for add_sub_ALU.
	SIGNAL logOutput : STD_LOGIC_VECTOR (31 downto 0);--output for logical_ALU.
	SIGNAL shOutput : STD_LOGIC_VECTOR (31 downto 0);--output for shift_ALU.
	SIGNAL aluOutput : STD_LOGIC_VECTOR (31 downto 0); -- this used for be able to add delay on output
	SIGNAL  aluOvf :   STD_LOGIC;  -- this used for be able to add delay on Out_1
	SIGNAL  aluZero :   STD_LOGIC; -- this used for be able to add delay on Out_1
	SIGNAL  aluCout :   STD_LOGIC; -- this used for be able to add delay on Out_1
	SIGNAL  logZero :   STD_LOGIC; -- logZero, logCout, logOvf for logical_ALU.
	SIGNAL  logCout :   STD_LOGIC;
	SIGNAL  logOvf :   STD_LOGIC;
	SIGNAL  asOvf :   STD_LOGIC;-- asOvf, asCout, asZero for add_sub_ALU.
	SIGNAL  asCout :   STD_LOGIC;
	SIGNAL  asZero :   STD_LOGIC; 
	SIGNAL  shZero :   STD_LOGIC;-- shZero, shCout, shOvf for shift_ALU.
	SIGNAL  shCout :   STD_LOGIC;
	SIGNAL  shOvf :   STD_LOGIC;


Component add_sub_ALU is
    
	Port(A : in  STD_LOGIC_VECTOR (31 downto 0);
        B : in  STD_LOGIC_VECTOR (31 downto 0);
        Op : in  STD_LOGIC_VECTOR (3 downto 0);
        Out_1 : out  STD_LOGIC_VECTOR (31 downto 0);
        Zero : out  STD_LOGIC;
        Cout : out  STD_LOGIC;
        Ovf : out  STD_LOGIC);
end Component;	

Component logical_ALU is
    Port(A : in  STD_LOGIC_VECTOR (31 downto 0);
        B : in  STD_LOGIC_VECTOR (31 downto 0);
        Op : in  STD_LOGIC_VECTOR (3 downto 0);
        Out_1 : out  STD_LOGIC_VECTOR (31 downto 0);
		Zero : out  STD_LOGIC;
        Cout : out  STD_LOGIC;
        Ovf : out  STD_LOGIC);
end Component;	

Component shift_ALU is
    Port(A : in  STD_LOGIC_VECTOR (31 downto 0);
        B : in  STD_LOGIC_VECTOR (31 downto 0);
        Op : in  STD_LOGIC_VECTOR (3 downto 0);
        Out_1 : out  STD_LOGIC_VECTOR (31 downto 0);
		Zero : out  STD_LOGIC;
        Cout : out  STD_LOGIC;
        Ovf : out  STD_LOGIC);
end Component;
			 
begin
	--creating port maps for componenets.
    add_sub: add_sub_ALU PORT MAP(A => A, 
	B => B, Op => 
	Op, Out_1 => asOutput, 
	Zero => asZero, 
	Cout =>asCout, 
	Ovf => asOvf);
	 
	
    logical: logical_ALU PORT MAP(A => A,
	B => B,
	Op => Op,
	Out_1 => logOutput,
	Zero => logZero,
	Cout => logCout,
	Ovf => logOvf);
								  
	shift: shift_ALU PORT MAP(A => A,
	B => B,
	Op => Op,
	Out_1 => shOutput,
	Zero => shZero,
	Cout => shCout,
	Ovf => shOvf);	  
	
	
	-- choose module with Op 
	process(Op) 
	begin
		case Op is
			when (Op = "0000" OR Op = "0001") => aluOutput <= asOutput;
			when (Op = "0010" OR Op = "0011" OR Op = "0100" OR Op = "0101" OR Op = "0110") => aluOutput <=logOutput;
			when (Op = "1000" OR Op = "1001" OR Op = "1010" OR Op = "1100" OR Op = "1101"); => aluOutput <=shOutput;
		end case;
	end process;
	
	wait for 20ns;
	Out_1<=aluOutput;
	
	process(Op) 
	begin
		case Op is
			when (Op = "0000" OR Op = "0001") => aluZero <= asZero;
			when (Op = "0010" OR Op = "0011" OR Op = "0100" OR Op = "0101" OR Op = "0110") => aluZero <=logZero;
			when (Op = "1000" OR Op = "1001" OR Op = "1010" OR Op = "1100" OR Op = "1101"); => aluZero <=shZero;
		end case;
	end process;
	
	wait for 20ns;
	Zero <= aluZero;
	
	process(Op) 
	begin
		case Op is
			when (Op = "0000" OR Op = "0001") => aluCout <= asCout;
			when (Op = "0010" OR Op = "0011" OR Op = "0100" OR Op = "0101" OR Op = "0110") => aluCout <=logCout;
			when (Op = "1000" OR Op = "1001" OR Op = "1010" OR Op = "1100" OR Op = "1101"); => aluCout <=shCout;
		end case;
	end process;
	
	wait for 20ns;
	Cout <= aluCout;
	
	process(Op) 
	begin
		case Op is
			when (Op = "0000" OR Op = "0001") => aluOvf <= asOvf;
			when (Op = "0010" OR Op = "0011" OR Op = "0100" OR Op = "0101" OR Op = "0110") => aluOvf <=logOvf;
			when (Op = "1000" OR Op = "1001" OR Op = "1010" OR Op = "1100" OR Op = "1101"); => aluOvf <=shOvf;
		end case;
	end process;
	
	wait for 20ns;
	Ovf <= aluOvf;

end Stractural;

