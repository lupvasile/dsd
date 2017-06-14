----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2017 09:30:57 PM
-- Design Name: 
-- Module Name: it_network - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity it_network is
  Port ( inp:in std_logic_vector(1 to 5) := "11001";
        o1,o2,o3,o4,o5:out std_logic_vector(1 downto 0));
end it_network;

architecture Behavioral of it_network is

component cell is
port (x:in std_logic;
    y:in std_logic_vector(1 downto 0);
    yo,z:out std_logic_vector(1 downto 0)
    );
end component;

type mat is array(natural range<>) of std_logic_vector(1 downto 0);
signal inter:mat(1 to 5);
signal outs:mat(1 to 5);

begin
inter(1) <= "00";
f:for i in 1 to 4 generate
    f:cell port map (inp(i),inter(i),inter(i+1),outs(i));
end generate;

ff:cell port map (x=>inp(5),y=>inter(5),z=>outs(5));

o1<=outs(1);
o2<=outs(2);
o3<=outs(3);
o4<=outs(4);
o5<=outs(5);

end Behavioral;
