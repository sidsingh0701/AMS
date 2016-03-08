module selector(dataY,count,found1,found2,found3,found4,EOF);

output found1,found2,found3,found4;
input [255:0]dataY;

reg found1,found2,found3,found4;
output [2:0] count;
output EOF;

reg EOF;
reg [2:0] count;


always @(*)
begin
	found1 = 1'b0;
	found2 = 1'b0;
	found3 = 1'b0;
	found4 = 1'b0;
	if(dataY[255:253] == 3'b111)
		found1 = 1'b1;
	if(dataY[191:189] == 3'b111)
		found2 = 1'b1;
	if(dataY[127:125] == 3'b111)
		found3 = 1'b1;
	if(dataY[63:61] == 3'b111)
		found4 = 1'b1;
end

always@(*)
begin
	EOF = 1'b0;
	if (dataY[255:253] == 3'b111 && dataY[252:248] == 5'd0)
		EOF = 1'b1;
	if (dataY[191:189] == 3'b111 && dataY[188:184] == 5'd0)
		EOF = 1'b1;
	if (dataY[127:125] == 3'b111 && dataY[124:120] == 5'd0)
		EOF = 1'b1;
	if (dataY[63:61] == 3'b111 && dataY[60:56] == 5'd0)
		EOF = 1'b1;
end

always @(*)
begin
	casex({found1,found2,found3,found4})
	4'b1010: begin
			count = 3'd1;
		end
	4'b100x: begin
			count = 3'd2;
		end
	4'b01xx:
		begin
			count = 3'd2;
		end
	4'b0000:
		begin
			count = 3'd3;
		end
	4'b0010:
		begin
			count = 3'd2;
		end
	4'b0001:
		begin
			count = 3'd3;
		end
	default:
		begin
			count = 3'd0;
		end
	endcase
end
endmodule

