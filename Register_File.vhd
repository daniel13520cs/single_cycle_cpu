LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Register_File IS
PORT (CLK : IN std_ulogic;
    WE3 : IN std_ulogic; -- write control
    WD3 : IN std_logic_vector(31 DOWNTO 0); -- register input
    A3 : IN std_logic_vector(4 DOWNTO 0);-- address write
    A1 : IN std_logic_vector(4 DOWNTO 0);-- address port 0
    A2 : IN std_logic_vector(4 DOWNTO 0);-- address port 1
    RD1 : OUT std_logic_vector(31 DOWNTO 0); -- output port 0
    RD2 : OUT std_logic_vector(31 DOWNTO 0) -- output port 1
);
END ENTITY;
    
ARCHITECTURE behave OF Register_File IS
    SUBTYPE regT IS std_logic_vector(31 DOWNTO 0); 
    TYPE StorageT IS ARRAY(0 TO 31) OF regT; -- reg array TYPE
    SIGNAL registerfile : StorageT; -- reg file contents

BEGIN
-- write
PROCESS(CLK)
    BEGIN
    
    IF rising_edge(CLK) THEN
      IF WE3 = '1' THEN 
        registerfile(to_integer(unsigned(A3))) <= WD3;
      END IF;
    END IF;
END PROCESS;
--read
RD1 <= registerfile(to_integer(unsigned(A1)));
RD2 <= registerfile(to_integer(unsigned(A2)));
END behave; 