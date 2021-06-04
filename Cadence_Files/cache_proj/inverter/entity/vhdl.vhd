-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Mon Oct 26 12:52:35 2020


library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity inverter is
  port(
    input : in std_logic;
    output : out std_logic);
end inverter;
