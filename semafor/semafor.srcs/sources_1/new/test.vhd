library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity test is
--  Port ( );
end test;

architecture Behavioral of test is

component counter is
    port (
        CE,CLK,RST:in std_logic;
        outp:out std_logic_vector(4 downto 0)
          );
end component; 

component execution_unit is
    Port (
        I5,I27,I32,Red_out,Green_out:out std_logic;
        CET,CLK,RST,red_clip,green_clip,red,green:in std_logic
        );
end component;

component command_unit is
    Port (
        clk,rst,button:in std_logic;
        green,red,green_blink,red_blink,cet:out std_logic;
        i5,i27,i32:in std_logic
 );
end component;


shared variable end_sim:boolean := false;
constant clk_period:time := 50ns;
signal I5,I27,I32,Red_out,Green_out:std_logic;
signal CET,CLK,RST,red_clip,green_clip,red,green: std_logic;
signal outt:std_logic_vector(5 downto 1);
signal button,red_blink,green_blink:std_logic;

begin

a:execution_unit port map (I5,I27,I32,Red_out,Green_out,CET,CLK,RST,red_blink,green_blink,red,green);
aa:command_unit port map (clk,rst,button,green,red,green_blink,red_blink,cet,i5,i27,i32);

cu_sim:process
    begin
    RST <= '1';
    wait for CLK_PERIOD;
    
    RST <= '0';
    button <= '1';
    wait for clk_period;
    
    button <='0';
    wait for 74*clk_period;
    
    button<='1';
    wait for 34*clk_period;
    end_sim:=true;
    wait;
    end process;

clock_gen:process
    begin
    if END_SIM = true then wait;
    end if;
    
    CLK <='0';
    wait for CLK_PERIOD/2;
    
    CLK<='1';
    wait for CLK_PERIOD/2;
    end process;
end Behavioral;
