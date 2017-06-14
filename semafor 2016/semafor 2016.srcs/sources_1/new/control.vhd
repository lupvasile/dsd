library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity control is
  Port (clk,t5,t25:in std_logic;
        outs:out std_logic_vector(6 downto 0) );
end control;

architecture Behavioral of control is

component rom is
  Port ( address:in std_logic_vector(2 downto 0);
         cont:out std_logic_vector(7 downto 0));
end component;

component counter is
generic (n:natural:=3);

  Port ( clk,rst,ce:in std_logic;
         q:out std_logic_vector(n-1 downto 0)
         );
end component;

signal address:std_logic_vector(2 downto 0);
signal cond,rst,mux:std_logic;

begin

m:rom port map(address,cont(7)=>cond,cont(6 downto 0)=>outs);
cnt:counter generic map (3) port map(clk,rst,mux,address);

rst <= address(2) and address(0);
mux <= T5 when cond='0'
        else T25;
end Behavioral;
