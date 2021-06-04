#Created by Brendan Cain
#Makefile that compiles, elaborates, and simulates an entity with its testbench
#The commands below are the ones that are run
#
#run_ncvhdl.bash -messages -linedebug -cdslib cds.lib -hdlvar hdl.var -smartorder cache_cell.vhd
#run_ncelab.bash -messages -access rwc -cdslib cds.lib -hdlvar hdl.var cache_cell_test
#run_ncsim.bash -input cache_cell_ncsim.run -messages -cdslib cds.lib -hdlvar hdl.var cache_cell_test

#change the names below inorder to simulate other files. NOTE FILE NAMES NOT INCLUDED IN "ENTITY" AND "TESTBENCH"

ENTITY=cache_cell.vhd
TESTBENCH=cache_cell_test.vhd
RUN=cache_cell_ncsim.run

CADENCE_DIR = /afs/umbc.edu/users/b/c/bcain1/home/315/cadence
CDSLIB = -cdslib $(CADENCE_DIR)/cds.lib
HDLVAR = -hdlvar $(CADENCE_DIR)/hdl.var
CFLAGS = -messages -linedebug $(CDSLIB) $(HDLVAR) -smartorder

CC = $(CADENCE_DIR)/run_ncvhdl.bash
ELAB = $(CADENCE_DIR)/run_ncelab.bash
SIM = $(CADENCE_DIR)/run_ncsim.bash

simulate: elaborate
	@echo "Simulating..."
	@$(SIM) -input $(RUN) -messages -cdslib $(CADENCE_DIR)/cds.lib -hdlvar $(CADENCE_DIR)/hdl.var $(TESTBENCH:%.vhd=%)

elaborate: $(TESTBENCH)
	@echo "Elaborating..."
	@$(ELAB) -messages -access rwc -cdslib $(CADENCE_DIR)/cds.lib -hdlvar $(CADENCE_DIR)/hdl.var $(TESTBENCH:%.vhd=%)

$(TESTBENCH): $(ENTITY)
	@echo "Compiling "$(TESTBENCH)"..."
	@$(CC) $(CFLAGS) $(TESTBENCH) 

$(ENTITY):
	@echo "Compiling "$(ENTITY)"..."
	@$(CC) $(CFLAGS) $(ENTITY)
