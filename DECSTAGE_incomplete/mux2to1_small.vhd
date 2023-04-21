----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:31:20 04/15/2023 
-- Design Name: 
-- Module Name:    mux2to1_small - Behavioral 
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

--5 bit input multiplexer
entity mux2to1_small is
    Port ( DataIn_0 : in  STD_LOGIC_VECTOR (4 downto 0);
           DataIn_1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Sel : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (4 downto 0));
end mux2to1_small;

architecture Behavioral of mux2to1_small is

begin
	DataOut <= DataIn_0 when sel ='0' else DataIn_1;
end Behavioral;