module isched(clock,reset,addressI,data,dataI,NewRowFlag);

input clock;
input reset;
input  NewRowFlag;
input [191:0] data;

output [7:0] addressI;
output [47:0] dataI;

reg [2:0]  count;
reg [7:0]  addressI;
reg [47:0] dataI;
reg        FirstFlag;

wire select;




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

	if (count == 3'b100)
	begin
		count <= 3'd1;
		addressI <= addressI + 1'b1;
	end

end

always@(*)
begin
	dataI = 48'b0;
	if(count == 3'd1)
		dataI = data[191:144];
	else if(count == 3'd2)
		dataI = data[143:96];
	else if(count == 3'd3)
		dataI = data[95:48];
	else if(count == 3'd4)
		dataI = data[47:0];
end

endmodule
