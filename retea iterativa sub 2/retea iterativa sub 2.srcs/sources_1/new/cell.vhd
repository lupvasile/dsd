library ieee;
use ieee.std_logic_1164.all;

entity cell is
port (x:in std_logic;
    y:in std_logic_vector(1 downto 0);
    yo,z:out std_logic_vector(1 downto 0)
    );
end entity;

architecture behav of cell is
begin
yo(1) <= (not(y(1)) and x) or (y(1) and y(0) and not(x)) or (not(y(0)) and x);
yo(0) <= (y(1) and not(x)) or (not(y(1)) and not(y(0)) and x);
z(1)<= (y(1) and y(0)) or (y(1) and not x ) or (y(0) and not x);
z(0) <= (y(1) and x) or (not(y(1)) and y(0) and not x) or (not(y(1)) and not y(0) and x);
end architecture;
