module syncMult (clock, SyncY, SyncMultY, multinput, mult_output);

input        clock;
input [48:0] SyncY;
input [47:0] multinput;
 
output [47:0] SyncMultY;
output [48:0] mult_output;

wire [47:0] SyncMultY;
wire [48:0] mult_output; 

reg bit_buf1,bit_buf2,bit_buf3,bit_buf4,bit_buf5,bit_buf6,bit_buf7,bit_buf8,bit_buf9,bit_buf10;

assign SyncMultY = SyncY[47:0];

always@(posedge clock)
begin
	bit_buf1 <= SyncY[48];
	bit_buf2 <= bit_buf1;
	bit_buf3 <= bit_buf2;
	bit_buf4 <= bit_buf3;
	bit_buf5 <= bit_buf4;
	bit_buf6 <= bit_buf5;
	bit_buf7 <= bit_buf6;
	bit_buf8 <= bit_buf7;
	bit_buf9 <= bit_buf8;
end

assign mult_output[48] = bit_buf9;
assign mult_output[47:0] = multinput;

endmodule
