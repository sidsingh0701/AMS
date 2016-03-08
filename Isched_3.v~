module isched(clock,reset,addressI,data,dataI, FinalOutput,sig);

input clock;
input reset;
//input  NewRowFlag;
input [191:0] data;
//input [23:0] temp_output;
input [23:0]  FinalOutput;

output [7:0] addressI;
output [47:0] dataI;
input sig;

reg        NewRowFlag;
reg [2:0]  count;
reg [7:0]  addressI;
reg [47:0] dataI;
reg        FirstFlag;
//reg sig,sig2;


always@(posedge clock)
begin
	if (reset)
	begin
		count <= 3'd0;
		FirstFlag <= 1'b0;
		NewRowFlag <= 1'd1;
	end
	if (FinalOutput != 24'd0 && FirstFlag == 1'b0)
	begin
		addressI <= 8'd0;
		FirstFlag <= 1'b1;
		count <= 3'd1;
		NewRowFlag <= 1'd1;
	end

	if (FinalOutput != 24'd0 && FirstFlag == 1'b1)
	begin
		count <= count + 1'b1;
		NewRowFlag <= 1'd1;
	end
	if(FinalOutput == 24'd0)
		NewRowFlag <= 1'd0;
	
	if (count == 3'b100 && FinalOutput != 24'd0)
	begin
		count <= 3'd1;
		addressI <= addressI + 1'b1;
	end
	if (count == 3'b100 && FinalOutput == 24'd0)
	begin
		count <= 3'd0;
		addressI <= addressI + 1'b1;
	end
	if(sig)
	begin
		FirstFlag <= 1'b0;
		count <= 3'd0;
		NewRowFlag <= 1'd1;
		count <= 3'bx;
		addressI <= 8'hx;
		
	end

end

always@(*)
begin
	dataI = 48'b0;
	if(NewRowFlag == 1'd0)
		dataI = 48'b0;
	else if(count == 3'd1)
	begin
		dataI = data[191:144];
		//sig = |data[191:144];
	end
	else if(count == 3'd2)
	begin
		dataI = data[143:96];
		//sig = |data[143:96];
	end
	else if(count == 3'd3)
	begin
		dataI = data[95:48];
		//sig = |data[95:48];
	end
	else if(count == 3'd4)
	begin
		dataI = data[47:0];
		//sig = |data[47:0];
	end
end

/*always@(*)
begin
	if(count == 3'd1)
	begin
		sig = |data[143:96];
		//sig2 = |data[143:96];
	end

	else if (count == 3'd2)
	begin
		sig = |data[95:48];	
	end

	else if (count == 3'd3)
	begin
		sig = |data[47:0];
	end

	else if (count == 3'd4 || count == 3'd0)
	begin
		sig = |data[191:144];
	end
end*/

endmodule
