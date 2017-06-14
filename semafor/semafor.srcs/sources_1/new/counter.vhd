library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity counter is
    port (
        CE,CLK,RST:in std_logic;
        outt:out std_logic_vector(4 downto 0)
          );
end entity; 

architecture behav of counter is

begin
    process (CLK)
    variable state : std_logic_vector(4 downto 0);
    begin
        if RST = '1' then state := (others=>'0');
        elsif CE='1' and rising_edge(CLK) then
            state := state + 1;
        end if;
        
    outt <= state;
    end process; 

end architecture behav;