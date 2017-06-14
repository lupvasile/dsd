library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity control is
  Port ( TC,clk:in std_logic;
         la,lb,sa:out std_logic );
end control;

architecture Behavioral of control is

type state is (read,compute);
signal curr_state,next_state:state;

begin

clc:process(tc,curr_state)
begin
    la<='0';lb<='0';sa<='0';
    case curr_state is  
        when read => next_state<=compute;
                            la<='1';
                            lb<='1';
                            sa<='1';
        
        when compute => if tc='1' then next_state <= compute;
                        else next_state <= read;
                        end if;
    end case;
end process;

slc:process(clk)
begin
if rising_edge(clk) then        
    curr_state<=next_state;
end if;
end process; 
end Behavioral;
