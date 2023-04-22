--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:41:23 04/12/2021
-- Design Name:   
-- Module Name:   C:/Users/Leoni/project Xilinx/microProcessor/decstage_test.vhd
-- Project Name:  microProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DECSTAGE
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY decstage_test IS
END decstage_test;
 
ARCHITECTURE behavior OF decstage_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DECSTAGE
    PORT(
         Instr : IN  std_logic_vector(31 downto 0);
         RF_WrEn : IN  std_logic;
			rst : in std_logic;
         ALU_out : IN  std_logic_vector(31 downto 0);
         MEM_out : IN  std_logic_vector(31 downto 0);
         RF_WrData_sel : IN  std_logic;
         RF_B_sel : IN  std_logic;
         ImmExt : IN  std_logic_vector(1 downto 0);
         Clk : IN  std_logic;
         Immed : OUT  std_logic_vector(31 downto 0);
         RF_A : OUT  std_logic_vector(31 downto 0);
         RF_B : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Instr : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrEn : std_logic := '0';
   signal ALU_out : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_out : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrData_sel : std_logic := '0';
   signal RF_B_sel : std_logic := '0';
   signal ImmExt : std_logic_vector(1 downto 0) := (others => '0');
   signal Clk : std_logic := '0';
	signal rst : std_logic := '0';

 	--Outputs
   signal Immed : std_logic_vector(31 downto 0);
   signal RF_A : std_logic_vector(31 downto 0);
   signal RF_B : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DECSTAGE PORT MAP (
	       rst => rst,
          Instr => Instr,
          RF_WrEn => RF_WrEn,
          ALU_out => ALU_out,
          MEM_out => MEM_out,
          RF_WrData_sel => RF_WrData_sel,
          RF_B_sel => RF_B_sel,
          ImmExt => ImmExt,
          Clk => Clk,
          Immed => Immed,
          RF_A => RF_A,
          RF_B => RF_B
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
      rst <= '1';
      wait for 100 ns;		
      -- hold reset state for 100 ns.
       --                   /.AWR/....IMMEDIATE../		
		 --        ..op../.RR1/.RR2/RR21/
		Instr   <= "10000000000000100001100000000000";
      RF_WrEn <= '1'; 
      ALU_out <= "00000000000000000000000000000010"; -- reg Din
      MEM_out <= "00000000000000000000000000000000"; -- reg Din
      RF_WrData_sel <= '0'; -- 0 ALU ... 1 MEM
      RF_B_sel <= '1'; -- 0 RR21 ... 1 RR2
      rst<='0';
      wait for 100 ns;	
		 --                   /.AWR/....IMMEDIATE../		
		 --        ..op../.RR1/.RR2/RR21/
		Instr   <= "10000000010000110000000000000000";
      RF_WrEn <= '1'; 
      ALU_out <= "00000000000000000000000000000010"; -- reg Din
      MEM_out <= "00000000000000000000000000000011"; -- reg Din
      RF_WrData_sel <= '1'; -- 0 ALU ... 1 MEM
      RF_B_sel <= '0'; -- 0 RR21 ... 1 RR2
      
      wait for 100 ns;
		 --                   /.AWR/....IMMEDIATE../		
		 --        ..op../.RR1/.RR2/RR21/
		Instr   <= "10000000011001000000000000000000";
      RF_WrEn <= '1'; 
      ALU_out <= "00000000000000000000000000000010"; -- reg Din
      MEM_out <= "00000000000000000000000000000101"; -- reg Din
      RF_WrData_sel <= '1'; -- 0 ALU ... 1 MEM
      RF_B_sel <= '1'; -- 0 RR21 ... 1 RR2
      
      wait for 100 ns;
		 --                   /.AWR/....IMMEDIATE../		
		 --        ..op../.RR1/.RR2/RR21/
		Instr   <= "10000000100010100000000000000000";
      RF_WrEn <= '1'; 
      ALU_out <= "00000000000000000000000000001010"; -- reg Din
      MEM_out <= "00000000000000000000000000000101"; -- reg Din
      RF_WrData_sel <= '0'; -- 0 ALU ... 1 MEM
      RF_B_sel <= '1'; -- 0 RR21 ... 1 RR2
      
      wait for 100 ns;
		--                   /.AWR/....IMMEDIATE../		
		 --        ..op../.RR1/.RR2/RR21/
		Instr   <= "10000001010111110000000000000000";
      RF_WrEn <= '1'; 
      ALU_out <= "00000000000000000000000000000010"; -- reg Din
      MEM_out <= "00000000000000000000000000011111"; -- reg Din
      RF_WrData_sel <= '1'; -- 0 ALU ... 1 MEM
      RF_B_sel <= '1'; -- 0 RR21 ... 1 RR2
      
      wait for 100 ns;
		 --                   /.AWR/....IMMEDIATE../		
		 --        ..op../.RR1/.RR2/RR21/
		Instr   <= "10000000011000000000000000000000";
      RF_WrEn <= '1'; 
      ALU_out <= "00000000000000000000000000000010"; -- reg Din
      MEM_out <= "00000000000000000000000000000101"; -- reg Din
      RF_WrData_sel <= '1'; -- 0 ALU ... 1 MEM
      RF_B_sel <= '1'; -- 0 RR21 ... 1 RR2
      
      wait for 100 ns;
		 --                   /.AWR/....IMMEDIATE../		
		 --        ..op../.RR1/.RR2/RR21/
		Instr   <= "10000000000010100000000000000000";
      RF_WrEn <= '0'; 
      ALU_out <= "00000000000000000000000000000111"; -- reg Din
      MEM_out <= "00000000000000000000000000000101"; -- reg Din
      RF_WrData_sel <= '0'; -- 0 ALU ... 1 MEM
      RF_B_sel <= '1'; -- 0 RR21 ... 1 RR2
      
      wait for 100 ns;
		 --                   /.AWR/....IMMEDIATE../		
		 --        ..op../.RR1/.RR2/RR21/
		Instr   <= "11100001010001001111100000000000";
      RF_WrEn <= '0'; 
      ALU_out <= "00000000000000000000000000000010"; -- reg Din
      MEM_out <= "00000000000000000000000000000101"; -- reg Din
      RF_WrData_sel <= '1'; -- 0 ALU ... 1 MEM
      RF_B_sel <= '1'; -- 0 RR21 ... 1 RR2
      ImmExt <= "01"; -- sign extend
      wait for 100 ns;
		 --                   /.AWR/....IMMEDIATE../		
		 --        ..op../.RR1/.RR2/RR21/
		Instr   <= "11100101010001001111100000000000";
      RF_WrEn <= '1'; 
      ALU_out <= "00000000000000000000000000000010"; -- reg Din
      MEM_out <= "00000000000000000000000000000101"; -- reg Din
      RF_WrData_sel <= '1'; -- 0 ALU ... 1 MEM
      RF_B_sel <= '1'; -- 0 RR21 ... 1 RR2
      ImmExt <= "10"; -- sll 16
      wait for 100 ns;
		 --                   /.AWR/....IMMEDIATE../		
		 --        ..op../.RR1/.RR2/RR21/
		Instr   <= "11001001010001010000000000000011";
      RF_WrEn <= '1'; 
      ALU_out <= "00000000000000000000000000000010"; -- reg Din
      MEM_out <= "00000000000000000000000000000111"; -- reg Din
      RF_WrData_sel <= '1'; -- 0 ALU ... 1 MEM
      RF_B_sel <= '1'; -- 0 RR21 ... 1 RR2
      ImmExt <= "00"; -- zero fill
      wait for 100 ns;
		 --                   /.AWR/....IMMEDIATE../		
		 --        ..op../.RR1/.RR2/RR21/
		Instr   <= "00000000000001011000000000000001";
      RF_WrEn <= '0'; 
      ALU_out <= "00000000000000000000000000000010"; -- reg Din
      MEM_out <= "00000000000000000000000000000101"; -- reg Din
      RF_WrData_sel <= '1'; -- 0 ALU ... 1 MEM
      RF_B_sel <= '1'; -- 0 RR21 ... 1 RR2
      ImmExt <= "11"; -- sign extend
      wait for 100 ns;

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
