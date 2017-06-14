library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity cuptor is
  Port (clk1,clk2,rst,start:in std_logic;
        food,preh,cook:out std_logic );
end cuptor;

architecture Behavioral of cuptor is

component comm_unit is
  Port (clk,rst,start,ts,t5,t25:in std_logic;
        cook,preh,food,heat,z5,z25,reset5,reset25:out std_logic );
end component;

component exec_unit is
  Port (heat,z5,z25,reset5,reset25,rst,clk:in std_logic;
        ts,t5,t25:out std_logic );
end component;

signal ts,t5,t25,heat,z5,z25,reset5,reset25:std_logic;

begin

c1:comm_unit port map(clk1,rst,start,ts,t5,t25,cook,preh,food,heat,z5,z25,reset5,reset25);
c2:exec_unit port map(heat,z5,z25,reset5,reset25,rst,clk2,ts,t5,t25);
end Behavioral;
