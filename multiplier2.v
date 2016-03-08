module multiply2(clock, element1, element2,new1);

input         clock;
input [47:0]  element1;
input [47:0]  element2;

output [47:0] new1;

wire [47:0] new1;
//output [47:0] new2;

wire [23:0] buf1;
wire [23:0] buf6;
wire [23:0] buf11;
wire [23:0] buf16;
wire [23:0] buf21;
wire [23:0] buf26;

reg [23:0] buf2;
reg [23:0] buf3;
reg [23:0] buf4;
reg [23:0] buf5;
reg [23:0] buf7;
reg [23:0] buf8;
reg [23:0] buf9;
reg [23:0] buf10;
reg [23:0] buf12;
reg [23:0] buf13;
reg [23:0] buf14;
reg [23:0] buf15;
reg [23:0] buf17;
reg [23:0] buf18;
reg [23:0] buf19;
reg [23:0] buf20;
reg [23:0] buf22;
reg [23:0] buf23;
reg [23:0] buf24;
reg [23:0] buf25;
reg [23:0] buf27;
reg [23:0] buf28;
reg [23:0] buf29;
reg [23:0] buf30;


reg [23:0] s1;
reg [23:0] r1;
reg [23:0] s2;
reg [23:0] r2;
reg [23:0] s3;
reg [23:0] r3;
reg [23:0] s4;
reg [23:0] r4;
reg [23:0] s5;
reg [23:0] r5;
reg [23:0] s6;
reg [23:0] r6;



always @(posedge clock)

begin
	s1 <= element1[47:24];
	r1 <= element2[47:24];

        buf2 <= buf1;
	buf3 <= buf2;
	buf4 <= buf3;
	buf5 <= buf4;	
	
end	
	DW_fp_mult_48  u1(.a(s1), .b(r1), .rnd(3'b000), .z(buf1));
always @(posedge clock)
begin
	s2 <= element1[23:0];
	r2 <= element2[23:0];	

	buf7 <= buf6;
	buf8 <= buf7;
	buf9 <= buf8;
	buf10 <= buf9;
end	
	DW_fp_mult_48  u2(.a(s2), .b(r2), .rnd(3'b000), .z(buf6));
always @(posedge clock)
begin
	s3 <= buf5;
	r3 <= buf10;	

	buf12 <= buf11;
	buf13 <= buf12;
	buf14 <= buf13;
end	
	addsub u3 (.clock(clock), .inst_a(s3), .inst_b(r3), .inst_rnd(3'b000), .inst_op(1'b1), .z_inst(buf11)); // ac-bd

 always @(posedge clock)
begin
	s4 <= element1[23:0];
	r4 <= element2[47:24];	

	buf17 <= buf16;
	buf18 <= buf17;
	buf19 <= buf18;
	buf20 <= buf19;
end	
	DW_fp_mult_48  u4(.a(s4), .b(r4), .rnd(3'b000), .z(buf16));
always @(posedge clock)
begin
	s5 <= element1[47:24];
	r5 <= element2[23:0];	

	buf22 <= buf21;
	buf23 <= buf22;
	buf24 <= buf23;
	buf25 <= buf24;
end	
	DW_fp_mult_48  u5(.a(s5), .b(r5), .rnd(3'b000), .z(buf21));
always @(posedge clock)
begin
	s6 <= buf20;
	r6 <= buf25;	

	buf27 <= buf26;
	buf28 <= buf27;
	buf29 <= buf28;
end	
	addsub u6(.clock(clock), .inst_a(s6), .inst_b(r6), .inst_rnd(3'b000), .inst_op(1'b0), .z_inst(buf26));// i(bc + ad)*/

assign new1[47:24] = buf14;
assign new1[23:0] = buf29;
//assign new1[48] = bit_buf9;

endmodule

