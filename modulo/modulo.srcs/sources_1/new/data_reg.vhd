library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity data_reg is
generic (n:natural);
  Port ( din:in std_logic_vector(1 to n);
        clk,load:in std_logic;
          dout:out std_logic_vector(1 to n));
end data_reg;

architecture Behavioral of data_reg is

begin

process (clk)
variable state:std_logic_vector(1 to n);
begin
if rising_edge(clk) and load='1' then   
    state:=din;
end if;
dout<=state;
end process;

end Behavioral;
