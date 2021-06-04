-- Entity: and2_test (and2 testbench)
-- Archtecture: test
-- Author: bcain1
-- Created On: 11/9/2020
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity and2_test is
end and2_test;

architecture test of and2_test is

  component and2
    port (
      input1 : in std_logic;
      input2 : in std_logic;
      output : out std_logic);
  end component;

  for a2_1 : and2 use entity work.and2(structural);
  signal ip1, ip2, op : std_logic;
  signal clk : std_logic;

begin
  a2_1: and2 port map (ip1, ip2, op);

  --makes clock go
  clk: process
  begin
    clk<='0','1' after 5 ns;
    wait for 10 ns;

  end process clk;

  -- reads in file
  io_process: process
    file infile : text is in "and2_in.txt";
    file outfile : text is out "and2_out.txt";
    variable rd_1, rd_2, op1 : std_logic;
    variable buf : line;

  --testbench logic
  begin
    while not(endfile(infile)) loop
      readline(infile, buf);
      read(buf, rd_1);
      read(buf, rd_2);
      ip1 <= rd_1;
      ip2 <= rd_2;

      wait until falling_edge(clk);
      op1 := op;

      write(buf, op1);
      writeline(outfile, buf);
    end loop;
    wait;

  end process io_process;
end test;
