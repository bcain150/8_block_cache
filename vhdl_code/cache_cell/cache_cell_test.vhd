
-- Entity: cache_cell_test
-- Architecture: test
-- Author: bcain1
-- Date: 11/9/2020
library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_cell_test is
end cache_cell_test;

architecture test of cache_cell_test is

  component cache_cell
    port(wr_d     : in  std_logic;
         wr_e     : in  std_logic;
         rd_e     : in  std_logic;
         rd_e_bar : in  std_logic;
         rd_d     : out std_logic);
  end component;

  for c1 : cache_cell use entity work.cache_cell(structural);
  
  signal d_in, d_out : std_logic;
  signal clk_rd, clk_wr : std_logic;

begin
  c1: cache_cell port map (d_in, clk_wr, clk_rd, not(clk_rd), d_out);

  --makes wr enable clock go
  wr_clk: process
  begin
    clk_wr<='0','1' after 5 ns;
    wait for 10 ns;

  end process wr_clk;

  --makes rd enable clock go
  rd_clk: process
  begin
    clk_rd<='0','1' after 10 ns;
    wait for 20 ns;

  end process rd_clk;

  -- reads in file
  io_process: process
    file infile : text is in "cache_cell_in.txt";
    file outfile : text is out "cache_cell_out.txt";
    
    variable ip1, op1 : std_logic;
    variable buf : line;

  --testbench logic
  begin
    if not(endfile(infile)) then
      writeline(outfile, "in  out");
    end if;
    while not(endfile(infile)) loop
      readline(infile, buf);
      read(buf, ip1);
      write(buf, ip1);
      d_in <= ip1;
      --doing this will show when a bit is overwritten before it can be read again
      wait until falling_edge(clk_wr);
      op1 := d_out;
      write(buf, "    ");
      write(buf, op1);
      
      -- label the read as a bad read if the rd_en is low
      if clk_rd = '0' then
      	write(buf, 'x');
      end if;
      writeline(outfile, buf);
    end loop;
    wait;

  end process;
end test;
