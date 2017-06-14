library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity execution_unit is
    Port (
        I5,I27,I32,Red_out,Green_out:out std_logic;
        CET,CLK,RST,red_clip,green_clip,red,green:in std_logic
        );
end entity;



architecture Behavioral of execution_unit is

component counter is
    port (
        CE,CLK,RST:in std_logic;
        outt:out std_logic_vector(4 downto 0)
          );
end component; 

signal timp:std_logic_vector(4 downto 0);

begin

red_out <= red or (red_clip and not(clk));
green_out <= green or (green_clip and not(clk));

cnt:counter port map(CE=>CET, clk=>clk, rst=>rst, outt=>timp);

I5 <= timp(2);--timp(2) and (not timp(1)) and timp(0);
I27 <= timp(4) and timp(3) and timp(1);
I32 <= timp(4) and timp(3) and timp(2) and timp(1) and timp(0);


end Behavioral;
