
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Instruction_MEM is
port ( A : in std_logic_vector( 31 downto 0);
       RD : out std_logic_vector (31 downto 0)
       );
       
end Instruction_MEM;

architecture Behavioral of Instruction_MEM is
signal addr: std_logic_vector(3 downto 0);
type ROM_T is array (0 to 79) of std_logic_vector(7 downto 0);
constant rom : ROM_T := (
"00000100",
"00000001",
"00000000",
"00000010",

"00000100",
"00000011",
"00000000",
"00001010",

"00000100",
"00000100",
"00000000",
"00001110",

"00000100",
"00000101",
"00000000",
"00000010",

"00100000",
"01100100",
"00000000",
"00000010",

"00100000",
"01100011",
"00000000",
"00000001",

"00000000",
"10000011",
"00100000",
"00000011",

"00001000",
"00000100",
"00000000",
"00000001",

"00000000",
"01100010",
"00100000",
"00000101",

"00001100",
"01000100",
"00000000",
"00001010",
"00000000",
"01100010",
"00100000",
"00000111",
"00011100",
"01100010",
"00000000",
"00000001",
"00010000",
"01000100",
"00000000",
"00001010",
"00000000",
"01100010",
"00100000",
"00001001",
"00010100",
"01000100",
"00000000",
"00001010",
--"00011000",
--"01000100",
--"00000000",
--"00001010",
"00101000",
"00000101",
"11111111",
"11111110",
"00100100",
"10000101",
"00000000",
"00000000",
"00101100",
"10000101",
"00000000",
"00000000",
"00110000",
"00000000",
"00000000",
"00010100",
"11111100",
"00000000",
"00000000",
"00000000"
--others => x"00"
);

begin
--A <= A (3 downto 0);
--with pc select 
RD <= rom(to_integer(unsigned(A))) &  rom(to_integer(unsigned(A)) + 1) &  rom(to_integer(unsigned(A)) + 2) & rom(to_integer(unsigned(A)) + 3);

end Behavioral;
