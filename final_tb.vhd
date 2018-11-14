----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2018 03:04:31 PM
-- Design Name: 
-- Module Name: final_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity final_tb is
--  Port ( );
end final_tb;

architecture Behavioral of final_tb is
    signal clk:STD_LOGIC:= '0';
begin
CLOCK:
clk <=  '1' after 1 ns when clk = '0' else
        '0' after 1 ns when clk = '1';
UUT : entity work.final_fpga
PORT MAP( CLK100MHZ=>clk);
end Behavioral;
