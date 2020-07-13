module up_down(input clock,load,ud,reset, input [3:0]din,output reg [3:0]count);
//loadable 3 to 13 up/down counter

always@(posedge clock or posedge reset)
begin
	if(reset)
       	begin
	count<=13;
        end
 
	else if(load==1)
	begin
		if(din<3)
           	begin
		count<=13;
		end
		
							
	        else
		begin
		count<=din;
		end


        end
	else
	begin
		if(ud==1)
		begin
			if(count>13)	
			begin
				count<=3;
			end
		else
				count<=count+1;
		end
                
		else    if(ud==0)
			begin
			if(count<2)
			begin
				count<=15;
			end
		else
				count<=count-1;
		end
	
	end
end
endmodule
