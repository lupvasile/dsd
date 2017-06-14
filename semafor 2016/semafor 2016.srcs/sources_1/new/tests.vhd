
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tests is
--  Port ( );
end tests;

architecture Behavioral of tests is

component top_module is
  Port ( clk:in std_logic;
          red,green,yellow:inout std_logic_vector(1 to 8));
end component;

signal red,green,yellow: std_logic_vector(1 to 8);
signal clk:std_logic;
constant period:time := 1 sec;
begin

cu:top_module port map(clk, red,green,yellow);

cllk:process 
begin
clk<='1';
wait for period/2;
clk<='0';
wait for period/2;
end process;
end Behavioral;
