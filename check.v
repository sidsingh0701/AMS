module check(input1,input2,output_final);

input [47:0] input1;
input [47:0] input2;
output [47:0] output_final;

reg [47:0] output_final;

always@(*)
begin
	output_final = 48'b0;
	if(|input1)
		output_final = input2;
	else
		output_final = 48'b0;
end

endmodule
