module pad_3 (Element, PosElement, Y_ramRow, PaddedRow, RowReady);

input [47:0]  Element;
input [12:0]  PosElement;
input [255:0] Y_ramRow;

output [255:0] PaddedRow;
output         RowReady;

reg         RowReady;
reg [255:0] Buffer1;
reg [239:0] Buffer2;
reg [255:0] PaddedRow;


always@(*)
begin
	RowReady = 1'b1;
	Buffer1 = 256'h0;
	Buffer2 = 240'h0;
	PaddedRow = 256'h0;
	if (PosElement[1:0] == 2'b00)
	begin
		Buffer1 = (256'hffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffff)&Y_ramRow;
		Buffer2 = Element << 8'd192;
		PaddedRow = Buffer1|Buffer2;			
	end

	if (PosElement[1:0] == 2'b01)
	begin
		Buffer1 = (256'hffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffff)&Y_ramRow;
		Buffer2 = Element << 8'd128;
		PaddedRow = Buffer1|Buffer2;
	end
	
	if (PosElement[1:0] == 2'b10)
	begin
		Buffer1 = (256'hffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffff)&Y_ramRow;
		Buffer2 = Element << 8'd64;
		PaddedRow = Buffer1|Buffer2;
	end
	
	if (PosElement[1:0] == 2'b11)
	begin
		Buffer1 = (256'hffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000)&Y_ramRow;
		PaddedRow = Buffer1|Element;
	end
end

endmodule
 
