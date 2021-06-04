-- Entity: inv (inverter)
-- Archtecture: structural
-- Author: bcain1
-- Created On: 9/17/2020
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity inv is
  port(
    input : in std_logic;
    output : out std_logic);
end inv;

architecture structural of inv is

begin
  output <= not(input);
end structural;
