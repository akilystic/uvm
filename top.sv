
module top();
	parameter cycle = 10;
	bit clock;
	count_if DUV_IF (clock);
	
	up_down COUNT (.clock (clock),
			.reset (DUV_IF.reset),
			.din (DUV_IF.din),	 
			.count (DUV_IF.count),
			.load (DUV_IF.load),
			.ud (DUV_IF.ud));

	

	initial
	begin
		clock = 1'b0;
		forever # (cycle/2) 	clock = ~clock;
	end
endmodule
	

