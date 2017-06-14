library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity test is
generic (n:natural:=16);
  --Port ( );
end test;

architecture Behavioral of test is
component top_level is
generic (n:natural:=5);
  Port (clk:in std_logic;
        a,b:in std_logic_vector(n-1 downto 0);
        res:out std_logic_vector(n-1 downto 0);
        ready:out std_logic );
end component;

signal clk,ready:std_logic;
signal a,b,res: std_logic_vector(n-1 downto 0);
constant period:time := 100ns;
shared variable end_sim:boolean:=false;

begin

asDF:top_level generic map(n) port map(clk,a,b,res,ready);


testare:process
begin
    for i in 0 to 60000 loop
        for j in 1 to i-1 loop
            a<=std_logic_vector(to_unsigned(i,a'length));
            b<=std_logic_vector(to_unsigned(j,b'length));
          
            wait until a=res;            
            wait until ready = '1';
            assert (res=std_logic_vector((unsigned(a) mod unsigned(b)))) report "ASDF" severity error;
        end loop;
   end loop;
   end_sim:=true;
end process;

clock:process
begin
clk<='1';
wait for period/2;
clk<='0';
wait for period/2;

if end_sim=true then wait;
end if;
end process;
end Behavioral;
