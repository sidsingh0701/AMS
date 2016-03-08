module syncDiagonal (clock, outA, diagOut, adder_output);

input         clock;
input [47:0]  outA;
input [24:0]  adder_output;

output [47:0] diagOut;
reg    [47:0] diagOut;

reg [47:0] d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15;

always@(posedge clock)
begin
	d1 <= outA;
	d2 <= d1;
	d3 <= d2;
	d4 <= d3;
	d5 <= d4;
	d6 <= d5;
	d7 <= d6;
	d8 <= d7;
	d9 <= d8;
	d10 <= d9;
	d11 <= d10;
	d12 <= d11;
	//if (mult_output[48:24] == 25'b0)
	//begin
	//	d40 <= d12;
		d13 <= d12;
	//end
	//else
	d13 <= d12;
	
	d14 <= d13;
	d15 <= d14;


	if (adder_output[24])
	begin
		diagOut <= d15;
		
	end
end

endmodule
