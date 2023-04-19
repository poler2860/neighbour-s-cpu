----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:30:00 04/14/2023 
-- Design Name: 
-- Module Name:    IFSTAGE - Stractural 
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

entity IFSTAGE is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           PC : out  STD_LOGIC_VECTOR (31 downto 0);
			  Instr: out  STD_LOGIC_VECTOR (31 downto 0));
end IFSTAGE;

 architecture Stractural of IFSTAGE is
--signals to help manage the inputs/outputs of components.
signal mux2to1_out: STD_LOGIC_VECTOR (31 DOWNTO 0);
signal Adder_4_out: STD_LOGIC_VECTOR (31 DOWNTO 0);
signal register_out: STD_LOGIC_VECTOR (31 DOWNTO 0);
signal Adder_out: STD_LOGIC_VECTOR (31 DOWNTO 0);
	
	--IMEM component.
	component ROM1024 is
		Port(ADDRA: in STD_LOGIC_VECTOR (31 DOWNTO 0);
		--	ENA: in STD_LOGIC;
		--	CLKA: in STD_LOGIC;
			DOUTA: out STD_LOGIC_VECTOR (31 DOWNTO 0));
	end component;
	
	--multiplexer to choose between PC+4 or PC+4+Imm.
	component mux2to1 is
		Port(DataIn_Imm: in STD_LOGIC_VECTOR (31 DOWNTO 0);
			DataIn_4: in STD_LOGIC_VECTOR (31 DOWNTO 0);
			Sel: in STD_LOGIC;
			Data_Out: out STD_LOGIC_VECTOR (31 DOWNTO 0));
	end component;
	
	--adder/incrimentor for PC (PC+4).
	component Adder_4 is
		Port(DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	--adder : PC+4+Imm.
	component Adder is
		Port (DataIn_4 : in  STD_LOGIC_VECTOR (31 downto 0);
           DataIn_PCImmed : in  STD_LOGIC_VECTOR (31 downto 0);
           Data_Out : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;

	--PC register.
	component basic_register is
		Port(CLK: in STD_LOGIC;
			WE: in STD_LOGIC;
			Reset: in STD_LOGIC;
			R_in: in STD_LOGIC_VECTOR (31 downto 0);
			R_out: out STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
begin
	IMEM: ROM1024 PORT MAP(ADDRA => register_out,
									DOUTA => Instr);
	
	MUX: mux2to1 PORT MAP( DataIn_Imm => Adder_out,
								DataIn_4 => Adder_4_out,
								Sel => PC_Sel , 
								Data_Out=> mux2to1_out);
	
	Adder4 : Adder_4 PORT MAP(DataIn => register_out,
									DataOut => Adder_4_out);
									
	Adder_PCImned: Adder PORT MAP(DataIn_4=> Adder_4_out,
								DataIn_PCImmed=> Adder_out,
								Data_Out=> Adder_out);	
								
	PC_REGISTER: basic_register PORT MAP(CLK=>Clk,
													WE=> PC_LdEn,
													R_in =>  mux2to1_out,
													Reset => Rst,
													R_out => register_out);
end Stractural;
