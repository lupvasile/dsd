--reset sincron
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity counter is
generic (n:natural:=3);

  Port ( clk,rst,ce:in std_logic;
         q:out std_logic_vector(n-1 downto 0)
         );
end counter;

architecture Behavioral of counter is

begin

process(clk,rst)
variable state:std_logic_vector(n-1 downto 0):=(others=>'0');
begin
    if CE='1' and rising_edge(clk) then
        if rst='1' then state := (others=>'0');
            else state := state + 1;
        end if;
    end if;
    
    q <= state;
end process;

end Behavioral;
