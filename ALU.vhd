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
signal equalsZero: std_logic;
signal lessThanZero: std_logic;
signal result: STD_LOGIC_VECTOR (31 downto 0);
begin             

    with ALUControl select result <=
        SrcA + SrcB when x"0",
        SrcA - SrcB when x"1",
        SrcA and SrcB when x"2",
        SrcA or SrcB when x"3",
        SrcA nor SrcB when x"4",
        std_logic_vector(shift_left(signed(SrcA), to_integer(signed(SrcB)))) when x"5",
        SrcA - SrcB when x"6",
        SrcA - SrcB when x"7",
        SrcA - SrcB when others;--x"8";
        
        
    with result select equalsZero <=
        '1' when x"00000000",
        '0' when others;
   
   with ALUControl select Zero <=
        result(31) when x"6",
        equalsZero when x"7",
        not equalsZero when others;--x"8";
   
   ALUResult <= result;
end Behavioral;
