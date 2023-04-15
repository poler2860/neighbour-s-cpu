--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:32:25 04/10/2023	old date 02:12:24 04/05/2021
-- Design Name:   
-- Module Name:   C:/Users/Leoni/project Xilinx/microProcessor/ALU_test.vhd
-- Project Name:  microProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_test IS
END ALU_test;
 
ARCHITECTURE behavior OF ALU_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Op : IN  std_logic_vector(3 downto 0);
         Output : OUT  std_logic_vector(31 downto 0);
         Zero : OUT  std_logic;
         Cout : OUT  std_logic;
         Ovf : OUT  std_logic
        ); 
    END COMPONENT;
      
 
   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal Op : std_logic_vector(3 downto 0) := (others => '0');
 
 	--Outputs
   signal Output : std_logic_vector(31 downto 0);
   signal Zero : std_logic;
   signal Cout : std_logic;
   signal Ovf : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A, 
          B => B,
          Op => Op,
          Output => Output,
          Zero => Zero, 
          Cout => Cout,
          Ovf => Ovf
        );

   -- Clock process definitions
 --  <clock>_process :process
  -- begin
	--	<clock> <= '0';
	---	wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
  -- end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
     	A<="11110000000000000000000000000000";
		B<="11110000000110000000000000000000";
		Op<="0000";
      wait for 50 ns;
	   A<="10000100000000000000000011111111";
		B<="10110011111111111111111111111111";
		Op<="0000";
      wait for 50 ns;
		A<="11110000000110000000000000000000";
		B<="11110000000110000000000000000000";
		Op<="0001";
      wait for 50 ns;
	   A<="01111111111111111111111111111111";
		B<="10100000000000001111111100000110";
		Op<="0001";
      wait for 50 ns;	
		A<="11111111000000000000000000000111";
		B<="11111111100000000000000000000001";
		Op<="0000";
      wait for 50 ns;
	   A<="00000000000000000000000011111111";
		B<="00000000000000000111100000000000";
		Op<="0000";
      wait for 50 ns;
		A<="11111111000000000000000000000111";
		B<="11111111100000000000000000000001";
		Op<="0001";
      wait for 50 ns;
	   A<="00000000000000000000000011111111";
		B<="00000000000000000111100000000000";
		Op<="0001";
      wait for 50 ns;
		A<="00000000000000000000000011111111";
		B<="00000000000000000111100000011000";
		Op<="0010";
      wait for 50 ns;
      A<="00110000000000000010000011111111";
		B<="00000000000000000111100000000111";
		Op<="0011";
      wait for 50 ns;
	   A<="00111111111111110010000011111111";
		B<="00000000000000000111100000000111";
		Op<="0100";
      wait for 50 ns;
	   A<="00111111111100010010000011111111";
		B<="00000111000000000111100000000111";
		Op<="0101";
      wait for 50 ns; 
	   A<="00111111111100010010000011111111";
		B<="00000111000000000111100000000111";
		Op<="0101";
      wait for 50 ns;
     	A<="11110000000000000000000000000000";
		Op<="1001";
      wait for 50 ns;	
		A<="11111111111111111111111111111111";
		Op<="1001";
      wait for 50 ns;	
		
	   A<="00000000000000000000000000000000";
		Op<="1010";
      wait for 50 ns;	
		A<="00000000000000000000000000000001";
		Op<="1010";
      wait for 50 ns;	
			
		A<="00000000000000011111000000000011";
		Op<="1010";
      wait for 50 ns;
		A<="11110000000000000000000000011110";
		Op<="1100";
      wait for 50 ns;	
		A<="11111111111111111111111111111111";
		Op<="1100";
      wait for 50 ns;	
		A<="00000000000001111110000000001111";
		Op<="1100";
      wait for 50 ns;	
      A<="10000000000000011111000000000011";
		Op<="1101";
      wait for 50 ns;	
		A<="11110000000000000000000000011110";
		Op<="1101";
      wait for 50 ns;	
		A<="11111111111111111111111111111111";
		Op<="1101";
      wait for 50 ns;	
		A<="00000000000001111110000000001111";
		Op<="1101";
      wait for 50 ns;	
		
      wait;
   end process;

END;
