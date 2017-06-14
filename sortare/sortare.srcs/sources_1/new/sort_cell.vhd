
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sort_cell is
  Port ( x,CLK:in std_logic;
         min,max:out std_logic);
end sort_cell;

architecture Behavioral of sort_cell is
signal state:std_logic := '1';
--shared variable state:std_logic := '1';
begin

max<=state when state>x else x;
min<=state;
process(CLK)
begin
if(rising_edge(CLK) and state>x) then
    state<=x;
    --state:=x;
    end if;
end process;
end Behavioral;
