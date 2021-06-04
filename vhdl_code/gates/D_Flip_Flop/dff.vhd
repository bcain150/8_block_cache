--
-- Entity: dff
-- Architecture : structural
-- Author: cpatel2
--

library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity dff is                      
  port ( d   : in  std_logic;
         clk : in  std_logic;
         q   : out std_logic;
         qbar: out std_logic); 
end dff;                          

architecture structural of dff is 

  
begin
  
  output: process                 

  begin                           
    wait until ( clk'EVENT and clk = '0' ); 
    q <= d;
    qbar <= not d ;
  end process output;        

                             
end structural;
