-- Entity: Dlatch
-- Architecture: Structural
-- Author: cpatel
-- Date: copied from website on 11/9/2020

library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity Dlatch is                      
  port ( d   : in  std_logic;
         clk : in  std_logic;
         q   : out std_logic;
         qbar: out std_logic); 
end Dlatch;                          

architecture structural of Dlatch is 

 
  
begin
  
  output: process (d,clk)                  

  begin                           
    if clk = '1' then 
    q <= d;
    qbar <= not d ;
 end if; 
 end process output;        
                             
end structural;  
