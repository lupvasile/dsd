

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sort is
generic(nr_elem:natural:=5);
Port ( dataIn,CLK:std_logic;
        dataOut:out std_logic_vector(1 to nr_elem));
end sort;

architecture Behavioral of sort is
component sort_cell is
  Port ( x,CLK:in std_logic;
         min,max:out std_logic);
end component;

signal mins:std_logic_vector(1 to nr_elem);
signal maxs:std_logic_vector(0 to nr_elem);

begin

maxs(0) <= dataIn;
dataOut <= mins;

a:for i in 1 to nr_elem generate
    a:sort_cell port map (maxs(i-1),CLK,mins(i),maxs(i));
end generate;

end Behavioral;
