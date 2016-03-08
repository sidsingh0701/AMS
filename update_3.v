module update_3 (reset, clock, X, Y, NewRowX, NewRowY, DiagonalX, DiagonalY, PosDX, PosDY, DiagonalDoneX, DiagonalDoneY, Row_noX, Row_noY, EnableChange);

input        EnableChange;
input        reset;
input        clock;
input [15:0]  X;
input [15:0]  Y;
input [255:0]  NewRowX;
input [255:0]  NewRowY;
input [10:0]   Row_noX;
input [10:0]   Row_noY;

output [47:0] DiagonalX;	
output [47:0] DiagonalY;
output [12:0]  PosDX;
output [12:0]  PosDY;
output        DiagonalDoneX;
output        DiagonalDoneY;

reg [47:0] DiagonalX;
reg [47:0] DiagonalY;
reg [12:0]  PosDX;
reg [12:0]  PosDY;
reg        DiagonalDoneX;
reg        DiagonalDoneY;


/************** Computation for Diagonal Elements *************/
/*PosDx should be defined at the start only*/


always@(posedge clock)
begin
		//PosDX[17:8] <= Row_noX; 		
		if (reset || EnableChange)
		begin
			DiagonalDoneX <= 1'b0;
			DiagonalX <= 48'hx;
		end
	
		else if (NewRowX[255:253] == 3'b111 && NewRowX[247:240] == X[7:0])
			begin
				DiagonalX <= NewRowX[239:192];
				PosDX[1:0] <= 2'b00;
				PosDX[12:2] <= Row_noX; 
				DiagonalDoneX <= 1'b1;
			end

		else if (NewRowX[191:189] == 3'b111 && NewRowX[183:176] == X[7:0])
			begin
				DiagonalX <= NewRowX[175:128];
				PosDX[1:0] <= 2'b01;
				PosDX[12:2] <= Row_noX; 
				DiagonalDoneX <= 1'b1;
			 end
		else if (NewRowX[127:125] == 3'b111 && NewRowX[119:112] == X[7:0])
			begin
				DiagonalX <= NewRowX[111:64];
				PosDX[1:0] <= 2'b10;
				PosDX[12:2] <= Row_noX; 
				DiagonalDoneX <= 1'b1;
			 end
		else if (NewRowX[63:61] == 3'b111 && NewRowX[55:48] == X[7:0])
			begin
				DiagonalX <= NewRowX[47:0];
				PosDX[1:0] <= 2'b11;
				PosDX[12:2] <= Row_noX; 
				DiagonalDoneX <= 1'b1;
			 end
		//else
			//	DiagonalDoneX <= 1'b0;
end

/*always@(posedge clock)
begin
	case({PosX1,PosX2,PosX3,PosX4})

	4'b1000: begin
			DiagonalX <= NewRowX[239:192];
			PosDX <= 8'd239;
		 end

	4'b0100: begin
			DiagonalX <= NewRowX[175:128];
			PosDX <= 8'd175;
		 end

	4'b0010: begin
			DiagonalX <= NewRowX[111:64];
			PosDX <= 8'd111;
		 end

	4'b0001: begin
			DiagonalX <= NewRowX[47:0];
			PosDX <= 8'd47;
		 end
	endcase
end

always@(*)
begin
	PosY1 = 1'b0; PosY2 = 1'b0; PosY3 = 1'b0; PosY4 = 1'b0;
	if (NewRowY[255:253] == 3'b111 && NewRowY[247:240] == Y)
		PosY1 = 1'b1;
	if (NewRowY[191:189] == 3'b111 && NewRowY[183:176] == Y)
		PosY2 = 1'b1;
	if (NewRowY[127:125] == 3'b111 && NewRowY[119:112] == Y)
		PosY3 = 1'b1;
	if (NewRowY[63:61] == 3'b111 && NewRowY[55:48] == Y)
		PosY4 = 1'b1;
end

always@(posedge clock)
begin
	case({PosY1,PosY2,PosY3,PosY4})

	4'b1000: begin
			DiagonalY <= NewRowY[239:192];
			PosDY <= 8'd239;
		 end

	4'b0100: begin
			DiagonalY <= NewRowY[175:128];
			PosDY <= 8'd175;
		 end

	4'b0010: begin
			DiagonalY <= NewRowY[111:64];
			PosDY <= 8'd111;
		 end

	4'b0001: begin
			DiagonalY <= NewRowY[47:0];
			PosDY <= 8'd47;
		 end
	endcase
end*/
always@(posedge clock)
begin
		//PosDY[17:8] <= Row_noY; 		
		if (reset || EnableChange)
		begin
			DiagonalDoneY <= 1'b0;
			DiagonalY <= 48'hx;
		end

		else if (NewRowY[255:253] == 3'b111 && NewRowY[247:240] == Y[7:0])
			begin
				DiagonalY <= NewRowY[239:192];
				PosDY[1:0] <= 2'b00;
				PosDY[12:2] <= Row_noY; 
				DiagonalDoneY <= 1'b1;
			end

		else if (NewRowY[191:189] == 3'b111 && NewRowY[183:176] == Y[7:0])
			begin
				DiagonalY <= NewRowY[175:128];
				PosDY[1:0] <= 2'b01;
				PosDY[12:2] <= Row_noY; 
				DiagonalDoneY <= 1'b1;
			 end
		else if (NewRowY[127:125] == 3'b111 && NewRowY[119:112] == Y[7:0])
			begin
				DiagonalY <= NewRowY[111:64];
				PosDY[1:0] <= 2'b10;
				PosDY[12:2] <= Row_noY; 
				DiagonalDoneY <= 1'b1;
			 end
		else if (NewRowY[63:61] == 3'b111 && NewRowY[55:48] == Y[7:0])
			begin
				DiagonalY <= NewRowY[47:0];
				PosDY[1:0] <= 2'b11;
				PosDY[12:2] <= Row_noY; 
				DiagonalDoneY <= 1'b1;
			 end
		//else
		//		DiagonalDoneY <= 1'b0;
end
/**********************************************************************/
endmodule
