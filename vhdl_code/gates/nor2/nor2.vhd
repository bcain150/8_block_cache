-- Entity: nor2
-- Archtecture: structural
-- Author: bcain1
-- Created On: 11/9/2020
--
library IEEE;
use IEEE.std_logic_1164.all;

entity nor2 is

  port (
    input1 : in std_logic;
    input2 : in std_logic;
    output : out std_logic);
end nor2;

architecture structural of nor2 is
begin

  output <= not(in1 or in2);

end structural
  
