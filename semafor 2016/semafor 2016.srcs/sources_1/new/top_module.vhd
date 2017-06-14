library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity top_module is
  Port ( clk:in std_logic;
          red,green,yellow:inout std_logic_vector(1 to 8));
end top_module;

architecture Behavioral of top_module is

component exec is
  Port (inp:in std_logic_vector(6 downto 0);
        clk:in std_logic;
        red,yellow,green:inout std_logic_vector(1 to 8);
        t5,t25:out std_logic );
end component;

component control is
  Port (clk,t5,t25:in std_logic;
        outs:out std_logic_vector(6 downto 0) );
end component;

signal t5,t25:std_logic;
signal inter:std_logic_vector(6 downto 0);

begin
cu:control port map(clk,t5,t25,inter);
eu:exec port map(inter,clk,red,yellow,green,t5,t25);

end Behavioral;
