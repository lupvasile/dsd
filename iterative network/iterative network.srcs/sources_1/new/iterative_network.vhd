

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity iterative_network is
  Port ( inp:in std_logic_vector(1 to 5):="11110";
         z1,z2,z3,z4,z5:out std_logic_vector(1 downto 0));
end iterative_network;

architecture Behavioral of iterative_network is

component cell is
  Port ( y1,y0,x:in std_logic;
         yo1,yo0,z1,z0:out std_logic);
end component;

type mat is array(1 to 6) of std_logic_vector(1 downto 0);
signal inter:mat;
signal outs:mat;
begin

g:for i in 1 to 5 generate
    g:cell port map(inter(i)(1),inter(i)(0),inp(i),inter(i+1)(1),inter(i+1)(0),outs(i)(1),outs(i)(0));
end generate;

z1 <= outs(1);
z2 <= outs(2);
z3 <= outs(3);
z4 <= outs(4);
z5 <= outs(5);
inter(1) <= "11";


end Behavioral;
