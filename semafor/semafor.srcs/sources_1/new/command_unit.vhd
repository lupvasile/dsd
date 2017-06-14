library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity command_unit is
    Port (
        clk,rst,button:in std_logic;
        green,red,green_blink,red_blink,cet:out std_logic;
        i5,i27,i32:in std_logic
 );
end command_unit;

architecture Behavioral of command_unit is

type states is (waitt,rblink,gblink,g,locked);

signal curr_state, next_state : states;
signal outs:std_logic_vector(1 to 5);
begin

--green<=outs(1);red<=outs(2);green_blink<=outs(3);red_blink<=outs(4);cet<=outs(5);

CLC: process(curr_state,button,i5,i27,i32)
    begin
        green<='0';red<='0';green_blink<='0';red_blink<='0';cet<='0';
        case curr_state is
            when waitt =>  --outs <= (2=>'1', others=>'0');
                           red<='1';
                           if button = '1' then next_state <= rblink;
                           else next_state <= curr_state;
                           end if;  
                           
            when rblink => --outs <= (5=>'1', 4=>'1', others=>'0');
                           cet<='1';red_blink<='1';
                           if i5 = '1' then next_state <= g;
                           else next_state <= curr_state;
                           end if;
            
            when g      => --outs <= (5=>'1', 1=>'1', others=>'0');
                           cet<='1';green<='1';
                           if i27 = '1' then next_state <= gblink;
                           else next_state <= curr_state;
                           end if;

            when gblink => --outs <= (5=>'1', 3=>'1', others=>'0');
                           cet<='1';green_blink<='1';
                           if i32 = '1' then next_state <= locked;
                           else next_state <= curr_state;
                           end if;
                          
            when locked => --outs <= (5=>'1', 2=>'1', others=>'0');
                           cet<='1';red<='1';
                           if i32 = '1' then next_state <= waitt;
                           else next_state <= curr_state;
                           end if;                            
            end case;                                           
    end process;

SLC:process(clk,rst)
    begin
    if rst = '1' then curr_state <= waitt;
    elsif(rising_edge(CLK)) then
        curr_state<=next_state;
    end if;
    
    end process;
end Behavioral;
