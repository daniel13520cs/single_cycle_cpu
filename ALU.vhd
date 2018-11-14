----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 02:15:49 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( SrcA : in STD_LOGIC_VECTOR (31 downto 0);
           SrcB : in STD_LOGIC_VECTOR (31 downto 0);
           ALUControl : in STD_LOGIC_VECTOR (2 downto 0);
           Zero : out STD_LOGIC;
           ALUResult : out STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is
begin             
    with ALUControl select ALUResult <=
        SrcA + SrcB when "000",
        SrcA - SrcB when "001",
        SrcA and SrcB when "010",
        SrcA or SrcB when "011",
        SrcA nor SrcB when "100",
        std_logic_vector(shift_left(signed(SrcA), to_integer(signed(SrcB)))) when "101",
        (others => '0') when others;
end Behavioral;
