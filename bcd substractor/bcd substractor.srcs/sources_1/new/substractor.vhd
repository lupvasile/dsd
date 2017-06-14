library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity substractor is
port (a,b:in std_logic_vector(4 downto 0);
    res:out std_logic_vector(4 downto 0));
end entity;

architecture behav of substractor is
begin

res <= a-b;


end architecture ;