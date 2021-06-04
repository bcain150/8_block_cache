-- Entity: tx
-- Architecture : structural
-- Author: cpatel2
--
  
library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity tx is                      
  port ( sel   : in std_logic;
         selnot: in std_logic;
         input : in std_logic;
         output:out std_logic);
end tx;                          

architecture structural of tx is 

begin
	
  txprocess: process (sel, selnot, input)                 
  begin                           
    if (sel = '1' and selnot = '0') then
      output <= input;
    else
      output <= 'Z';
    end if;
  end process txprocess;        
 
end structural;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Entity: cache_cell
-- Architecture: Structural
-- Author: Brendan Cain
-- Date: 11/9/2020

library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity cache_cell is
  port(
    wr_d     : in  std_logic;
    wr_e     : in  std_logic;
    rd_e     : in  std_logic;
    rd_e_bar : in  std_logic;
    rd_d     : out std_logic);
end cache_cell;

architecture structural of cache_cell is
  component tx
    port ( sel   : in std_logic;
           selnot: in std_logic;
           input : in std_logic;
           output: out std_logic);
  end component;

  component Dlatch
    port ( d   : in  std_logic;
           clk : in  std_logic;
           q   : out std_logic;
           qbar: out std_logic);
  end component;

  for d_latch: Dlatch use entity work.Dlatch(structural);
  for t_gate: tx use entity work.tx(structural);

  signal q_out : std_logic;
  signal q_bar_unused : std_logic;
  
begin

  d_latch : Dlatch port map (wr_d, wr_e, q_out, q_bar_unused);
  t_gate  : tx port map (rd_e, rd_e_bar, q_out, rd_d);

end structural;
