library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity automat is
  Port (x,clk:in std_logic;
        z:out std_logic );
end automat;

architecture Behavioral of automat is

type state is (standby, run, verify, waitt);

signal curr_state,next_state: state;

begin

CLC:process(curr_state,x)
begin
    case curr_state is  
        when waitt => if x='0' then next_state <= standby;
                        else next_state <= waitt;
                        end if;

        when standby => if x='0' then next_state <= run;
                        else next_state <= waitt;
                        end if;

        when run => if x='0' then next_state <= verify;
                        else next_state <= standby;
                        end if;
    
        when verify => if x='0' then next_state <= waitt;
                                        else next_state <= run;
                                        end if;    
    end case;
end process;

SLC:process(clk)
begin
    if rising_edge (clk) then
        case curr_state is
            when waitt => if x='0' then z <= '1';
                            else z <= '0';
                            end if;

            when standby => if x='0' then z <= '1';
                            else z <= '0';
                            end if;

            when run => if x='0' then z <= '0';
                            else z <= '1';
                            end if;

            when verify => if x='0' then z <= '1';
                            else z <= '0';
                            end if;
        end case;
        
    curr_state <= next_state;
    end if;
    
end process;
end Behavioral;
