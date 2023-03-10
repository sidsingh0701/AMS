module diagonal_pipeline(clock,input_diagonal,output_diagonal);

input clock;
input [47:0] input_diagonal;
output [47:0] output_diagonal;

reg [47:0] buf1,buf2,buf3,buf4,buf5,buf6,buf7,buf8,buf9,buf10,buf11,buf12,output_diagonal;


always@(posedge clock)
begin
	buf1 <= input_diagonal;
	buf2 <= buf1;
	buf3 <= buf2;
	buf4 <= buf3;
	buf5 <= buf4;
	buf6 <= buf5;
	buf7 <= buf6;
	buf8 <= buf7;
	buf9 <= buf8;
	buf10 <= buf9;
	buf11 <= buf10;
	buf12 <= buf11;
	output_diagonal <= buf12;	
end

endmodule
