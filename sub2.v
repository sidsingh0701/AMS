module sub2 (clock, element1, element2,new1);

input         clock;
input [47:0]  element1;
input [47:0]  element2;

output [47:0] new1;

wire [47:0] new1;
//output [47:0] new2;

wire [23:0] buf5;

wire [23:0] buf1;

reg [23:0] buf4;
reg [23:0] buf2;
reg [23:0] buf3;
reg [23:0] buf7;
reg [23:0] buf6;
reg [23:0] buf8;

reg [23:0] s1;
reg [23:0] r1;
reg [23:0] s2;
reg [23:0] r2;

always @(posedge clock)
begin
	s1 <= element1[23:0];
	r1 <= element2[23:0];
//	dirtybuff1 <= element1[24];	
	

	buf2 <= buf1;
	buf3 <= buf2;
	buf4 <= buf3;
//	dirtybuff2 <= dirtybuff1;
//	dirtybuff3 <= dirtybuff2;
//	dirtybuff4 <= dirtybuff3;
end	
	addsub u1 (.clock(clock), .inst_a(s1), .inst_b(r1), .inst_rnd(3'b000), .inst_op(1'b1), .z_inst(buf1));
always @(posedge clock)
begin
	s2 <= element1[47:24];
	r2 <= element2[47:24];
//	dirtybuff1 <= element1[24];	
	

	buf6 <= buf5;
	buf7 <= buf6;
	buf8 <= buf7;
//	dirtybuff2 <= dirtybuff1;
//	dirtybuff3 <= dirtybuff2;
//	dirtybuff4 <= dirtybuff3;
end	
	addsub u2 (.clock(clock), .inst_a(s2), .inst_b(r2), .inst_rnd(3'b000), .inst_op(1'b1), .z_inst(buf5));
assign new1 = {buf8,buf4};

endmodule

