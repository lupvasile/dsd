library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity exec is
  Port (inp:in std_logic_vector(6 downto 0);
        clk:in std_logic;
        red,yellow,green:inout std_logic_vector(1 to 8);
        t5,t25:out std_logic );
end exec;

architecture Behavioral of exec is

component counter is
generic (n:natural:=3);

  Port ( clk,rst,ce:in std_logic;
         q:out std_logic_vector(n-1 downto 0)
         
         );
end component;

signal q5:std_logic_vector(2 downto 0);
signal q25:std_logic_vector(4 downto 0);
signal rst5,rst25,z25,z5:std_logic;


begin

z25<=not z5;
z5<=inp(6);

c5:counter generic map(3) port map(clk,rst5,z5,q5);
c25:counter generic map(5) port map(clk,rst25,z25,q25);

t5<=rst5;
t25<=rst25;
rst5 <= q5(2);
rst25 <= q25(4) and q25(3);

yellow(8)<='0';yellow(7)<='0';
red(5)<=red(1);yellow(5)<=yellow(1);green(5)<=green(1);
red(4)<=red(2);yellow(4)<=yellow(2);green(4)<=green(2);
red(6)<=red(2);yellow(6)<=yellow(3);green(6)<=green(3);
green(7)<=inp(1);red(7)<=not green(7);
green(8)<=inp(6);red(8)<=not green(8);

green(1)<=inp(5);
green(2)<=inp(3);
green(3)<=inp(1);

yellow(1)<=inp(4);
yellow(2)<=inp(2);
yellow(3)<=inp(0);

red(1) <= not(green(1) or yellow(1));
red(2) <= not(green(2) or yellow(2));
red(3) <= not(green(3) or yellow(3));
    
end Behavioral;
