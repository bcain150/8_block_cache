-- Entity: inv_test (inverter testbench)
-- Archtecture: test
-- Author: bcain1
-- Created On: 9/17/2020
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity inv_test is
end inv_test;

architecture test of inv_test is

  component inv
    port (
      input : in std_logic;
      output : out std_logic);
  end component;

  for i1 : inv use entity work.inv(structural);
  signal ip, op : std_logic;
  signal clk : std_logic;

begin
  i1: inv port map (ip, op);

  --makes clock go
  clk: process
  begin
    clk<='0','1' after 5 ns;
    wait for 10 ns;

  end process clk;

  -- reads in file
  io_process: process
    file infile : text is in "inv_in.txt";
    file outfile : text is out "inv_out.txt";
    variable ip1, op1 : std_logic;
    variable buf : line;

  --testbench logic
  begin
    while not(endfile(infile)) loop
      readline(infile, buf);
      read(buf, ip1);
      ip <= ip1;

      wait until falling_edge(clk);
      op1 := op;

      write(buf, op1);
      writeline(outfile, buf);
    end loop;
    wait;

  end process io_process;
end test;
