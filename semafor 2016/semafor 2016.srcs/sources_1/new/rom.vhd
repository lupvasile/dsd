
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity rom is
  Port ( address:in std_logic_vector(2 downto 0);
         cont:out std_logic_vector(7 downto 0));
end rom;

architecture Behavioral of rom is

type memT is array(natural range<>) of std_logic_vector(7 downto 0);
signal mem:memT(0 to 5) := (x"A0",x"51",x"82",x"45",x"88",x"54");

begin
cont <= mem(conv_integer(address));
end Behavioral;
