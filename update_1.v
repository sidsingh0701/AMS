module update_1(X, Y, Y_ramX, Y_ramY);

input [15:0]  X;
input [15:0]  Y;

output [10:0]  Y_ramX;
output [10:0]  Y_ramY;

assign Y_ramX = X >> 3'b100;
assign Y_ramY = Y >> 3'b100;

endmodule

