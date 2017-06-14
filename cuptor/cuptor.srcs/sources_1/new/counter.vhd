
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity counter is
generic (nrBits:natural:=3);
  Port ( rst,clk,CE:in std_logic;
         q:out std_logic_vector(nrBits-1 downto 0)
         );
end counter;

architecture Behavioral of counter is

begin

process (clk)
variable state:std_logic_vector(nrBits-1 downto 0);
begin
    if rising_edge(clk) then
        if rst = '1' then state := (others=>'0');
        elsif CE='1'  then
                state := std_logic_vector(unsigned(state)+1); 
        end if;
    end if;
    
    
    q <= state;
end process;

end Behavioral;
