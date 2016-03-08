module arithController (clock, reset, DiagonalX, DiagonalY, Element, NewElement, EnableChange, SubInput1, SubInput2, AddInput1, AddInput2, NewDiagonalX, NewDiagonalY, SubOutput, AddOutput, DiagonalXDone, DiagonalYDone);

input        clock;
input        reset;
input [47:0] DiagonalX;
input [47:0] DiagonalY;
input [47:0] Element;
input [47:0] NewElement;
input [23:0] SubOutput;
input [23:0] AddOutput;
input        EnableChange;

output [23:0] SubInput1;
output [23:0] SubInput2;
output [23:0] AddInput1;
output [23:0] AddInput2;
output [47:0] NewDiagonalX;
output [47:0] NewDiagonalY;
output        DiagonalXDone;
output        DiagonalYDone;

reg    [23:0] SubInput1;
reg    [23:0] SubInput2;
reg    [23:0] AddInput1;
reg    [23:0] AddInput2;
reg    [47:0] NewDiagonalX;
reg    [47:0] NewDiagonalY;
reg    [4:0]  Count;
reg           DiagonalXDone;
reg           DiagonalYDone;

always@(posedge clock)
begin
	if (reset || EnableChange)
	begin
		DiagonalXDone <= 1'b0;
		Count <= 4'b000;
	end
	
	else if (Element)
		Count<= Count + 1'b1;	

	if (Count == 4'b1001)
		NewDiagonalX[47:24] <= AddOutput;
	if (Count == 4'b1010)
	begin
		NewDiagonalX[23:0] <= AddOutput;
		DiagonalXDone <= 1'b1;
	end
	if (Count == 4'b1011)
		NewDiagonalY[47:24] <= AddOutput;
	if (Count == 4'b1100)
	begin
		NewDiagonalY[23:0] <= AddOutput;
		DiagonalYDone <= 1'b1;
	end
end

always@(*)
begin
	SubInput1 = 24'hxx;
	SubInput2 = 24'hxx;
	AddInput1 = 24'hxx;
	AddInput2 = 24'hxx;
	if (Count == 4'b0001)
	begin
		SubInput1 = Element[47:24];
		SubInput2 = NewElement[47:24];
	end
	if (Count == 4'b0010)
	begin
		SubInput1 = Element[23:0];
		SubInput2 = NewElement[23:0];
	end
	if (Count == 4'b0011)
	begin
		SubInput1 = Element[47:24];
		SubInput2 = NewElement[47:24];
	end
	if (Count == 4'b0100)
	begin
		SubInput1 = Element[23:0];
		SubInput2 = NewElement[23:0];
	end

	if (Count == 4'b0101)
	begin
		AddInput1 = DiagonalX[47:24];
		AddInput2 = SubOutput;
	end

	if (Count == 4'b0110)
	begin
		AddInput1 = DiagonalX[23:0];
		AddInput2 = SubOutput;
	end

	if (Count == 4'b0111)
	begin
		AddInput1 = DiagonalY[47:24];
		AddInput2 = SubOutput;
	end
	
	if (Count == 4'b1000)
	begin
		AddInput1 = DiagonalY[23:0];
		AddInput2 = SubOutput;
	end
		
end

endmodule


