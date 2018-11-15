library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity rotate_32_gate is
port(
  a: in std_logic_vector(31 downto 0);
  b: in std_logic_vector(5 downto 0);
  dir: in bit;
  q: out std_logic_vector(31 downto 0)
  );
end rotate_32_gate;

architecture rtl of rotate_32_gate is
type shift_Arr is array (0 to 31) of std_logic_vector(31 downto 0);
signal right_res_Arr : shift_Arr;
signal left_res_Arr : shift_Arr;

begin

    right_res_Arr(0) <= a;
    left_res_Arr(0) <= a;
    ASSIGN_SHIFT:
    for i in 1 to 31 generate
       right_res_Arr(i) <=a((i-1) downto 0) & a(31 downto i); 
       left_res_Arr(i) <= a((31-i) downto 0) & a(31 downto (31-i+1));
    end generate ASSIGN_SHIFT;
    
    with dir select 
      q <= left_res_Arr(to_integer(unsigned(b(4 downto 0)))) when '0',
      	   right_res_Arr(to_integer(unsigned(b(4 downto 0)))) when others;

end rtl;