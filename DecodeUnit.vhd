----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2018 09:46:14 PM
-- Design Name: 
-- Module Name: DecodeUnit - Behavioral
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

entity DecodeUnit is
port ( instruction : in std_logic_vector (31 downto 0);
       instruction_31_26 : out std_logic_vector (5 downto 0);
       instruction_25_21 : out std_logic_vector (4 downto 0);
       instruction_20_16 : out std_logic_vector (4 downto 0);
       instruction_15_11 : out std_logic_vector (4 downto 0);
       instruction_15_0 : out std_logic_vector (15 downto 0)
       );
end DecodeUnit;

architecture Behavioral of DecodeUnit is

begin
instruction_31_26 <= instruction (31 downto 26);
instruction_25_21 <= instruction (25 downto 21);
instruction_20_16 <= instruction (20 downto 16);
instruction_15_11 <= instruction (15 downto 11);
instruction_15_0 <= instruction (15 downto 0);
end Behavioral;
