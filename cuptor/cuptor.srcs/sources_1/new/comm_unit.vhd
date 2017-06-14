library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comm_unit is
  Port (clk,rst,start,ts,t5,t25:in std_logic;
        cook,preh,food,heat,z5,z25,reset5,reset25:out std_logic );
end comm_unit;

architecture Behavioral of comm_unit is

type state is (waitt,preheat,wait_food,wait_start,cooking);
signal curr_state,next_state:state;

begin

CLC:process(curr_state,start,ts,t5,t25)
begin
cook<='0';preh<='0';food<='0';heat<='0';z5<='0';z25<='0';reset5<='0';reset25<='0';

    case curr_state is
        when waitt => reset5 <= '1';
                        reset25<='1';
                        if start='1' then next_state <= preheat;
                        else next_state <= waitt; 
                        end if;
                        
        when preheat => heat<='1';
                        preh<='1';
                        if ts = '1' then next_state<=wait_food;
                        else next_state <= preheat;
                        end if;

                        
        when wait_food => z5<='1';
                        food<='1';
                        if t5 = '1' then next_state<=waitt;
                        else next_state <= wait_start;
                        end if;

                        
        when wait_start => z5<='1';
                        food<='1';
                        if start = '1' then next_state<=cooking;
                        else next_state <= wait_food;
                        end if;

                        
        when cooking => heat<='1';
                        z25<='1';
                        cook<='1';
                        if t25 = '1' then next_state<=waitt;
                        else next_state <= cooking;
                        end if;

    end case;
end process;

SLC:process(clk,rst)
begin
    if rst = '1' then curr_state <= waitt;
    elsif rising_edge(clk) then curr_state <= next_state;
    end if;
end process;

end Behavioral;
