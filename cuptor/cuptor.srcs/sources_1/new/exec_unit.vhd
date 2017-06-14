
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity exec_unit is
  Port (heat,z5,z25,reset5,reset25,rst,clk:in std_logic;
        ts,t5,t25:out std_logic );
end exec_unit;

architecture Behavioral of exec_unit is

component counter is
generic (nrBits:natural:=3);
  Port ( rst,clk,CE:in std_logic;
         q:out std_logic_vector(nrBits-1 downto 0)
         );
end component;

signal re5,re25:std_logic;
signal q5:std_logic_vector(2 downto 0);
signal q25:std_logic_vector(4 downto 0);

begin

re5 <= reset5 or q5(2) or rst;
re25 <= reset25 or (q25(4) and q25(3)) or rst;

c1:counter generic map (nrBits=>3) port map (rst=>re5,clk=>clk,CE=>z5,q=>q5); 
c2:counter generic map (nrBits=>5) port map (rst=>re25,clk=>clk,CE=>z25,q=>q25); 

ts <= '1' after 100 sec;

t5 <= q5(2);
t25 <= q25(4) and q25(3);
end Behavioral;
