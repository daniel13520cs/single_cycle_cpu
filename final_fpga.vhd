----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 01:53:28 PM
-- Design Name: 
-- Module Name: final_fpga - Behavioral
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

entity final_fpga is
  Port ( 
    CLK100MHZ : IN STD_LOGIC
  );
end final_fpga;

architecture Behavioral of final_fpga is

    signal PCSrc: STD_LOGIC;
    signal PCPlus4: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal PCBranch: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal PC: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal PC2: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal instr: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal MemtoReg: STD_LOGIC;
    signal MemWrite: STD_LOGIC;
    signal Branch: STD_LOGIC;
    signal ALUControl: STD_LOGIC_VECTOR(2 DOWNTO 0);
    signal ALUSrc: STD_LOGIC;
    signal RegDst: STD_LOGIC;
    signal RegWrite: STD_LOGIC;
    signal WriteReg: STD_LOGIC_VECTOR(4 DOWNTO 0);
    signal Result: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal RD1: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal RD2: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal SignImm: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal SrcB: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal PCBranchInput: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal Zero: STD_LOGIC;
    signal ALUResult: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal ReadData: STD_LOGIC_VECTOR(31 DOWNTO 0);
    

begin

MUX1: entity work.Mux32 PORT MAP(sel=>PCSrc,input0=>PCplus4,input1=>PCBranch, output=>PC);
PCreg: entity work.PCRegister PORT MAP(PC=>PC, nextPC=>PC2,CLK=>CLK100MHZ);
Instruction_Memory: entity work.Instruction_MEM PORT MAP(A=>PC2, RD=>instr);
Pcplus4adder: entity work.Adder32 PORT MAP(input0=>PC2, input1=>"00000000000000000000000000000100" ,output=>PCPlus4);
Control_Unit: entity work.ControlUnit PORT MAP(Op=>instr(31 DOWNTO 26), Funct=>instr(5 DOWNTO 0), MemtoReg=>MemtoReg, MemWrite=>MemWrite, Branch=>Branch, ALUControl=>ALUControl, ALUSrc=>ALUSrc, RegDst=>RegDst, RegWrite=>RegWrite);
Register_File: entity work.Register_File PORT MAP(CLK=>CLK100MHZ, A1=>instr(25 DOWNTO 21), A2=>instr(20 DOWNTO 16), A3=>WriteREG, WD3=>Result, WE3=>RegWrite, RD1=>RD1, RD2=>RD2);
Sign_Extend: entity work.SignExtend PORT MAP(input=>instr(15 DOWNTO 0), output=>SignImm);
MUX2: entity work.Mux5 PORT MAP(input0=>instr(20 DOWNTO 16), input1=>instr(15 DOWNTO 11), output=>WriteReg, sel=>RegDst);
MUX3: entity work.Mux32 PORT MAP(input0=>RD2, input1=>SignImm, sel=>ALUSrc, output=>SrcB);
Shift: entity work.LeftShift2 PORT MAP(input=>SignImm, output=>PCBranchInput);
ALU: entity work.ALU PORT MAP(SrcA=>RD1, SrcB=>SrcB, ALUControl=>ALUControl, ZERO=>ZERO, ALUResult=>ALUResult);
PCbranchadder: entity work.Adder32 PORT MAP(input0=>PCBranchInput, input1=>PCPlus4, output=>PCBranch);
PCSrc<=Branch AND Zero;
Data_Memory: entity work.data_mem PORT MAP(CLK=>CLK100MHZ, A=>ALUResult(5 downto 0), WD=>RD2, WE=>MemWrite, RD=>ReadData);
MUX4: entity work.Mux32 PORT MAP(input0=>ALUResult, input1=>ReadData, sel=>MemtoReg, output=>Result);



end Behavioral;
