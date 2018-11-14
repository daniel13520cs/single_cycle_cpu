library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity Data_Mem is
    Port(A : in std_logic_vector(5 downto 0);
        CLK, WE: in std_ulogic;
        WD: in std_logic_vector(31 downto 0);
        RD: out std_logic_vector(31 downto 0)
        );
end Data_Mem;

architecture Behavioral of Data_Mem is
type RAM_T is array (0 to 15) of std_logic_vector(31 downto 0);
signal RAM : RAM_T;
begin 
    process(CLK)
    begin 
      if CLK'event and CLK = '1' then
        if WE = '1' then
          RAM(to_integer(unsigned(A))) <= WD;
        end if;
        RD <= Ram(to_integer(unsigned(A)));
      end if;
  end process;
end Behavioral;
