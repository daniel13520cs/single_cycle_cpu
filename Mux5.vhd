----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2018 03:07:24 PM
-- Design Name: 
-- Module Name: Mux5 - Behavioral
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

entity Mux5 is
    Port ( input0 : in STD_LOGIC_VECTOR (4 downto 0);
           input1 : in STD_LOGIC_VECTOR (4 downto 0);
           sel : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (4 downto 0));
end Mux5;

architecture Behavioral of Mux5 is
begin
    with sel select output <=
    input0 when '0',
    input1 when '1';
end Behavioral;
