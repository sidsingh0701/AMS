module EOF_reg(clock,reset,EOF,OP,sig);

input EOF;
input clock;
input reset;
output sig;

reg [5:0] count;
output    OP;
reg       OP;
reg       OPCheck;
wire	  sig;

always@(posedge clock)
begin
	if(reset)
	begin
		count <= 6'b0;
		OP <= 1'b0;
		OPCheck <= 1'b0;
	end
	else if(count < 6'd46 && OPCheck)
	begin
		count <= count + 1'b1;
		OP <= 1'b0;
	end
	else if(count == 6'd46 && OPCheck)
	begin
		count <= 6'd0;
		OP <= 1'b1;
		OPCheck <= 1'b0;
	end
	else if(!OPCheck && count == 6'd0)
		OP <= 1'b0;
	if(EOF ==1'b1)
		OPCheck <= 1'b1;
end

assign sig = (OP == 1'b1);



endmodule
