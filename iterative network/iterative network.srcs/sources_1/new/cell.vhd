
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity cell is
  Port ( y1,y0,x:in std_logic;
         yo1,yo0,z1,z0:out std_logic);
end cell;

architecture Behavioral of cell is

begin

yo1 <= x or not(y0) or y1;
yo0 <= not(y1 xor y0);
z1 <= y0 or (y1 and not(x));
z0 <= not(y0) or (y1 and x) or (not(y1) and not(x));

end Behavioral;
