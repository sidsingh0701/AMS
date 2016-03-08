module write_enable(input_data,input_data2,signal,signal2);

input [47:0] input_data,input_data2;
output signal,signal2;

reg signal,signal2;

always@(*)
begin
	//signal = 1'bx;
	if(input_data == 48'b0 || input_data == 48'h800000000000)
		signal = 1'b0;
	else if(input_data != 48'b0) 
		signal = 1'b1;
end


always@(*)
begin
	signal2 = 1'bx;
	if(input_data2 == 48'b0 || input_data2 == 48'h800000000000)
		signal2 = 1'b0;
	else if(input_data2 != 48'b0)
		signal2 = 1'b1;
end

endmodule
