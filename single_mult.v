module single_mult(clock,operand1,operand2,output_final);

input clock;
input [23:0] operand1;
input [23:0] operand2;

output [23:0] output_final;

wire [23:0] output_final;
wire [23:0] buf3;

reg [23:0] buf1,buf2,buf4,buf5,buf6,buf7;

always@(posedge clock)
begin
	buf1 <= operand1;
	buf2 <= operand2;

	buf4 <= buf3;
	buf5 <= buf4;
	buf6 <= buf5;
	buf7 <= buf6;
end
	DW_fp_mult_48  u1(.a(buf1), .b(buf2), .rnd(3'b000), .z(buf3));


assign output_final = buf7;

endmodule
