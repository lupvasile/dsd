library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity bcd_substractor is
port (a,b:in std_logic_vector(3 downto 0);
    bin:in std_logic;
    bout:out std_logic;
    res:out std_logic_vector(3 downto 0));
end entity;

architecture behav of bcd_substractor is

component substractor is
port (a,b:in std_logic_vector(4 downto 0);
    res:out std_logic_vector(4 downto 0));
end component;

component adder is
port (a,b:in std_logic_vector(4 downto 0);
    res:out std_logic_vector(4 downto 0));
end component;


signal res1,res2,bb:std_logic_vector(4 downto 0);

begin
a1:adder port map(a(4)=>'0',a(3 downto 0)=>b,b(0)=>bin,b(4 downto 1)=>"0000",res=>bb);
aa:substractor port map (a(4)=>'0',a(3 downto 0)=>a,b=>bb,res=>res1);
aaa:adder port map(res1,"01010",res2);

bout<=res1(4);

res <= res2(3 downto 0) when res1(4) = '1'
              else res1(3 downto 0);

--process (a,b,bin)
--variable aa,bb,ress:std_logic_vector(4 downto 0);
--begin
--    aa(3 downto 0) := a;
--    bb(3 downto 0) := b;
    
--    aa(4) := '0';bb(4) := '0';
    
--    bb := bb + bin;
--    if bb>aa then 
--        ress := aa+10-bb;
--        bout<='1';
--    else ress := aa-bb;
--        bout<='0';
--    end if;
    
--    res<=ress(3 downto 0);
--end process;

end architecture ;