library	ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity test is
port (i1,i0:in std_logic;
    inp1,inp2:std_logic_vector(7 downto 0);
       output:out std_logic;
       outp:out std_logic_vector(7 downto 0));
	end test;

architecture A of test is		   

signal clk,oup:std_logic;

begin

--clk <= (not oup and not i0) or (not i1 and oup);

--toogle: process(clk)
--variable state:std_logic:='0';
--begin
--    if rising_edge(clk) then state:=not state;
--    end if;
--    oup<=state;
--end process; 

--output<=oup;


    outp <= std_logic_vector(unsigned(inp1) / unsigned(inp2));

end A;