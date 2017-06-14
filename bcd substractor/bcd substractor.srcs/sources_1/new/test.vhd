library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
--use ieee.
entity test is
--  Port ( );
end test;

architecture Behavioral of test is
component big_substractor is
  Port (a1,a2,a3,b1,b2,b3:in std_logic_vector(3 downto 0) ;
        res1,res2,res3:out std_logic_vector(3 downto 0)
        );
end component;

signal a1,a2,a3,b1,b2,b3,res1,res2,res3:std_logic_vector(3 downto 0);
signal bout:std_logic;

begin
aa:big_substractor port map (a1,a2,a3,b1,b2,b3,res1,res2,res3);
process 
begin



for i in 0 to 999 loop
    for j in 0 to i loop
        a1<=conv_std_logic_vector(i mod 10,a1'length);
        b1<=conv_std_logic_vector(j mod 10,b1'length);
        a2<=conv_std_logic_vector(i/10 mod 10,a1'length);
        b2<=conv_std_logic_vector(j/10 mod 10,b1'length);
        a3<=conv_std_logic_vector(i/100 mod 10,a1'length);
        b3<=conv_std_logic_vector(j/100 mod 10,b1'length);

        wait for 1ms;
        end loop;
    end loop;

wait;
end process;

end Behavioral;
