----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2017 10:17:55 AM
-- Design Name: 
-- Module Name: DFipFlop - Behavioral
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

entity DFipFlop is
Port (d,rst,clk:in std_logic;
q,nq:out std_logic);
end DFipFlop;

architecture arh1 of DFipFlop is

begin

process (rst,clk)
begin
    if rst = '1' then q<='0';
                    nq <= '1';
    elsif rising_edge(clk)then  q<=d;
                          nq <= not d;
    end if; 
end process;

end arh1;

architecture arh2 of DFipFlop is

begin

process 
begin
    if rst = '1' then q<='0';
                    nq <= '1';
    elsif rising_edge(clk)then  q<=d;
                          nq <= not d;
    end if; 
    wait on rst,clk;
end process;

end arh2;
