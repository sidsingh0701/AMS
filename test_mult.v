module test_mult;
reg [47:0] ip1,ip2;
reg clock;

initial 
begin
	clock = 0;
	#12
	ip1 = 48'hD8358AD68572;
	ip2 = 48'hd92eb0d92424;
end
	always #5 clock = ~clock;		
	mult_compute a1(.clock(clock),.element1(ip1),.element2(ip2));
endmodule
