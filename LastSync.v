module LastSync (clock, op_final, op_reg);

input clock;
input [47:0] op_final;

output [47:0] op_reg;
reg    [47:0] op_reg;

 always@(posedge clock)
 begin
	op_reg <= op_final;
 end

endmodule
