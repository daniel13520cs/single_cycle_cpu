----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 03:05:40 PM
-- Design Name: 
-- Module Name: ControlUnit - Behavioral
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

entity ControlUnit is
    Port ( Op : in STD_LOGIC_VECTOR (5 downto 0);
           Funct : in STD_LOGIC_VECTOR (5 downto 0);
           MemtoReg : out STD_LOGIC;
           MemWrite : out STD_LOGIC;
           Branch : out STD_LOGIC;
           ALUControl : out STD_LOGIC_VECTOR (2 downto 0);
           ALUSrc: out STD_LOGIC;
           RegDst : out STD_LOGIC;
           RegWrite : out STD_LOGIC);
end ControlUnit;

architecture Behavioral of ControlUnit is
signal inter_ALUContorl: STD_LOGIC_VECTOR (2 downto 0);
begin
    with Op select MemtoReg <=
        '1' when x"07",
        '0' when others;
        
    with Op select MemWrite <=
        '1' when x"08",
        '0' when others;
    
    with Op select Branch <=
        '1' when x"08",
        '1' when x"09",
        '1' when x"0A",
        '0' when others;
    
    with Funct select inter_ALUContorl<=
        "000" when x"01",
        "001" when x"03",
        "010" when x"05",
        "011" when x"07",
        "100" when x"09",
        "101" when others;
        
    with Op select ALUControl <=
        inter_ALUContorl when x"00",
        "000" when x"01",
        "001" when x"02",
        "010" when x"03",
        "100" when x"04",
        "101" when x"05",
        "000" when x"07",
        "000" when x"08",
        "001" when x"09",
        "001" when x"0A",
        "001" when x"0B",
        "101" when others;
        
    with Op select ALUSrc <=
        '0' when x"00",
        '1' when others;
        
     with Op select RegDst <=
        '0' when x"00",
        '1' when others;
     
     with Op select RegWrite<=
        '1' when x"00" ,
        '1' when x"01" ,
        '1' when x"02" ,
        '1' when x"03" ,
        '1' when x"04" ,
        '1' when x"05" ,
        '1' when x"07" ,
        '0' when others;
        
end Behavioral;
