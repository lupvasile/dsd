library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity exec is
generic (n:natural);
  Port (a,b:in std_logic_vector(n-1 downto 0);
        la,lb,sa,clk:in std_logic;
        res:out std_logic_vector(n-1 downto 0); 
        tc,ready:out std_logic
        );
end exec;

architecture Behavioral of exec is

component data_reg is
generic (n:natural);
  Port ( din:in std_logic_vector(1 to n);
        clk,load:in std_logic;
          dout:out std_logic_vector(1 to n)
          );
end component;

signal a_in,ra,rb,scaz:std_logic_vector(n-1 downto 0);
signal load_a,ttc:std_logic;

begin

a_in <= a when sa='1'
        else scaz;
ttc <= '1' when ra>=rb
      else '0';
scaz <= ra-rb;
res <= ra;

ready <= not ttc;
load_a<=la or ttc;
tc<=ttc;

rra:data_reg generic map(n) port map (a_in,clk,load_a,ra);
rrb:data_reg generic map(n) port map (b,clk,lb,rb);



end Behavioral;
