module isched(clock,reset,addressI,data,dataI, FinalOutput);

input clock;
input reset;
//input  NewRowFlag;
input [191:0] data;
input [23:0]  FinalOutput;

output [7:0] addressI;
output [47:0] dataI;

reg        NewRowFlag;
reg [2:0]  count;
reg [7:0]  addressI;
reg [23:0] dataI;
reg        FirstFlag;

always@(*)
begin
	if (FinalOutput == 24'd0)
		NewRowFlag = 1'b0;
	else if (FinalOutput != 24'd0)
		NewRowFlag = 1'b1;
end

always@(posedge clock)
begin
	if (reset)
	begin
		count <= 3'd0;
		FirstFlag <= 1'b0;
	end
	if (NewRowFlag == 1'b1 && FirstFlag == 1'b0)
	begin
		addressI <= 8'd0;
		FirstFlag <= 1'b1;
		count <= 3'd1;
	end

	if (NewRowFlag == 1'b1 && FirstFlag == 1'b1)
	begin
		count <= count + 1'b1;
	end

	if (count == 3'b011)
	begin
		count <= 3'd0;
		addressI <= addressI + 1'b1;
	end

end

always@(*)
begin
	dataI = 24'b0;
	if(count == 3'd0 && NewRowFlag == 1'b1)
		dataI = data[191:168];
	else if(count == 3'd1 && NewRowFlag == 1'b1)
		dataI = data[143:120];
	else if(count == 3'd2 && NewRowFlag == 1'b1)
		dataI = data[95:72];
	else if(count == 3'd3 && NewRowFlag == 1'b1)
		dataI = data[47:24];
end

endmodule
