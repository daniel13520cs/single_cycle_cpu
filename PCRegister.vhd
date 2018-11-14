
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PCRegister is
port (CLK : in std_ulogic;
      nextPC : in std_logic_vector (31 downto 0);
      pc : out std_logic_vector (31 downto 0)
      ); 
end PCRegister;

architecture Behavioral of PCRegister is

signal pc_reg : std_logic_vector (31 downto 0);


begin
process (CLK) begin 

  if (CLK'event and CLK = '1') then
    pc_reg <= nextPC;
  end if;
  pc <= pc_reg;
end process;
end Behavioral;
