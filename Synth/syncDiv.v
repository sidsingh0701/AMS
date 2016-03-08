module syncDiv(element1,op1,op2,clock);
input clock;
//input reset;

input [47:0] element1;

output [23:0] op1,op2;
wire [23:0] op1,op2;

reg [47:0] buf1,buf2,buf3,buf4,buf5,buf6,buf7,buf8,buf9,buf10;

always@(posedge clock)
begin
	buf1 <= element1;
	buf2 <= buf1;
	buf3 <= buf2;
	buf4 <= buf3;
	buf5 <= buf4;
	buf6 <= buf5;
	buf7 <= buf6;
	buf8 <= buf7;
	buf9 <= buf8;
	buf10 <= buf9; 
end


assign op1 = buf10[47:24];
assign op2 = buf10[23:0];

endmodule
