module up_down(input clock,load,ud,reset, input [3:0]din,output reg [3:0]count);


always@(posedge clock or posedge reset)
begin
	if(reset)
       	begin
	count<=4'b0000;
        end
 
	else if(load==1)
		begin
		   count<=din;
		end

	else if(ud==1)
		begin 
				count<=count+1;
		end
                
		else if(ud==0)
			begin
				count<=count-1;
			end
	

end
endmodule