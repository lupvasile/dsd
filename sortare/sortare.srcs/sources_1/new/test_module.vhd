library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity test_module is
constant n:natural:=10;
end test_module;

architecture Behavioral of test_module is
component sort is
generic(nr_elem:natural:=5);
Port ( dataIn,CLK:std_logic;
        dataOut:out std_logic_vector(1 to nr_elem));
end component;

signal dataIn,CLK:std_logic;
signal dataOut: std_logic_vector(1 to n);
constant clk_period: time := 20 ns;
shared variable end_sim :boolean := false;
begin

a:sort generic map(n) port map(dataIn,CLK,dataOut);

process
begin

for i in 1 to n/2 loop
dataIn<='1';
wait for clk_period;
end loop;

for i in 1 to n/2 loop
dataIn<='0';
wait for clk_period;
end loop;

end_sim:=true;
wait;
end process;
clock_gen:process
    begin
    
    if not end_sim then
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    else wait;
    end if;
    end process clock_gen;


end Behavioral;
