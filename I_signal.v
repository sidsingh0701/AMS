module I_signal(signal_I,clock,reset,sig);

input clock,reset;
output signal_I;
reg [3:0] count;
reg signal_I;
input sig;
reg sigCheck;


always@(posedge clock)
begin
	if(reset)
	begin
		count <= 4'b0000;
		signal_I <= 1'b0;
		sigCheck <= 1'b0;	
	end
	else if (sig && sigCheck == 1'b0)
	begin
		count <= 4'b0000;
		signal_I <= 1'b0;
	end
	else if (!sig && sigCheck == 1'b0)
		sigCheck <= 1'b1;
	else if(count < 4'b1011 && (sigCheck == 1'b1))
		count <= count + 1'b1;
	else if (count == 4'b1011)
	begin
		count <= 4'b0000;
		sigCheck <= 1'b0;
		signal_I <= 1'b1;
	end
end
endmodule
