library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top_level is
generic (n:natural:=5);
  Port (clk:in std_logic;
        a,b:in std_logic_vector(n-1 downto 0);
        res:out std_logic_vector(n-1 downto 0);
        ready:out std_logic);
end top_level;

architecture Behavioral of top_level is

component exec is
generic (n:natural);
  Port (a,b:in std_logic_vector(n-1 downto 0);
        la,lb,sa,clk:in std_logic;
        res:out std_logic_vector(n-1 downto 0); 
        tc,ready:out std_logic
        );
end component;


component control is
  Port ( TC,clk:in std_logic;
         la,lb,sa:out std_logic );
end component;

signal la,lb,tc,sa:std_logic;

begin
cu:control port map (tc,clk,la,lb,sa);
eu:exec generic map(n) port map(a,b,la,lb,sa,clk,res,tc,ready);

end Behavioral;
