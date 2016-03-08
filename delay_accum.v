module delay_accum (clock, adder_out7, adder_out7_imag, delay1);

input clock;
input [23:0] adder_out7;
input [23:0] adder_out7_imag;

output [47:0] delay1;
reg    [47:0] delay1;

always@(posedge clock)
begin
	delay1 <= {adder_out7,adder_out7_imag};
	//delay1 <= delay2;

end

endmodule
