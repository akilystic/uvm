interface count_if (input bit clock);

	logic [3:0] din;
	logic [3:0] count;
	logic ud;
	logic load;
	logic reset;

	//write driver clocking block

	clocking wr_cb @ (posedge clock);
		default input #1 output #1;
                output reset;
		output din; 
		output load; 
		output ud;
	endclocking

	//write monitor clocking block

	clocking wr_mon_cb @ (posedge clock);
		default input #1 output #1;
		input din; 
		input load; 
		input ud;
	endclocking

	//read monitor clocking block

	clocking rd_mon_cb @ (posedge clock);
		default input #1 output #1;
		input count; 
	endclocking

	//write driver modport

	modport WR_DRV (clocking wr_cb);

	//write monitor modport

	modport WR_MON (clocking wr_mon_cb);

	//read monitor modport

	modport RD_MON (clocking rd_mon_cb);

endinterface


