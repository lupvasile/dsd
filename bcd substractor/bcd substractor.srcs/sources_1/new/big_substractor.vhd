

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity big_substractor is
  Port (a1,a2,a3,b1,b2,b3:in std_logic_vector(3 downto 0) ;
        res1,res2,res3:out std_logic_vector(3 downto 0)
        );
end big_substractor;

architecture Behavioral of big_substractor is

component bcd_substractor is
port (a,b:in std_logic_vector(3 downto 0);
    bin:in std_logic;
    bout:out std_logic;
    res:out std_logic_vector(3 downto 0));
end component;

signal bout1,bout2,asdf:std_logic;

begin

t1:bcd_substractor port map(a1,b1,'0',bout1,res1);
t2:bcd_substractor port map(a2,b2,bout1,bout2,res2);
t3:bcd_substractor port map(a3,b3,bout2,asdf,res3);


end Behavioral; 
