
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
signal addr: std_logic_vector(31 downto 0);
type ROM_T is array (0 to 15) of std_logic_vector(31 downto 0);
--constant rom : ROM_T := (
--"00000100000000010000000000000111",
--"00000100000000100000000000001000",
--"00000000010000010001100000010000",
--"11111100000000000000000000000000",
--x"00000000",
--x"00000000",
--x"00000000",
--x"00000000",
--x"00000000",
--x"00000000",
--x"00000000",
--x"00000000",
--x"00000000",
--x"00000000",
--x"00000000",
--x"00000000"
--);
constant rom : ROM_T := (
"00000100000000010000000000000010",
"00000100000000110000000000001010",
"00000100000001000000000000001110",
"00000100000001010000000000000010",
"00100000011001000000000000000010",
"00100000011000110000000000000001",
"00000000100000110010000000010001",
"00001000000001000000000000000001",
"00000000011000100010000000010010",
"00001100010001000000000000001010",
"00000000011000100010000000010011",
"00011100011000100000000000000001",
"00010000010001000000000000001010",
"00000000011000100010000000010100",
"00010100010001000000000000001010",
"00011000010001000000000000001010",
"00101000000001011111111111111110",
"00100100100001010000000000000000",
"00101100100001010000000000000000",
"00110000000000000000000000010100",
"11111100000000000000000000000000"
);
begin
--A <= A (3 downto 0);
--with pc select 
RD <= rom(to_integer(unsigned(A))) when A < x"00000020" else x"00000000";

end Behavioral;