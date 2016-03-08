module top_2(clock,addressY,reset, Vout, SyncY, SyncV, mult_output,adder_out7);

input reset;
input clock;
output [10:0] addressY;
//output [47:0] outA,outB;
output [47:0] Vout;
output [47:0] SyncY;
output [47:0] SyncV;
output [47:0] mult_output;
output [23:0] adder_out7;
//output [3:0] count,count3;
//output [2:0] count2;

reg  [47:0] Element;
reg [24:0] reg_outB;
wire [2:0] count;
wire found1,found2,found3,found4;
wire [47:0] outA;
wire [48:0] outB;
wire [10:0] addressY;
wire [255:0]data;
wire [10:0] ElementAddr;
wire [8:0]  Rowread1;
wire [8:0]  Rowread2;
wire [8:0]  Rowread3;
wire [8:0]  Rowread4;
wire [47:0] vop1;
wire [47:0] vop2;
wire [47:0] vop3;
wire [47:0] vop4;
wire [47:0] Vout;
wire [47:0] SyncY;
wire [47:0] SyncV;
wire [47:0] mult_output;
wire [23:0] adder_input;
wire [24:0] adder_output;
wire [23:0] adder_out1,adder_out2,adder_out3,adder_out4;
wire [23:0] adder_out5,adder_out6,adder_out7;

 selctor a1 (.dataY(data),.count(count),.found1(found1),.found2(found2),.found3(found3),.found4(found4));
 y_arbiter a2 (.reset(reset),.clock(clock),.addressY(addressY),.count2(count));
 decoder a3 (.clock(clock), .reset(reset), .data(data), .Diagonal(outA), .Element(outB), .ElementAddr(ElementAddr));
 y_sram a4 (.clock(clock),.ReadAddress1(addressY),.ReadBus1(data));
 always @(posedge clock)
 begin
	reg_outB <= outB[48:24];
 end
 controller2 a5 (.clock(clock),.reset(reset), .accum_in(adder_output), .feedback(adder_input),.set_bit(outB[48]), .element(outB[48:24]),.adder_out1(adder_out1),.adder_out2(adder_out2),.adder_out3(adder_out3),.adder_out4(adder_out4));
 mult_compute a6 (.clock(clock), .element1(reg_outB), .element2(adder_input),.new1(adder_output));
 mult_compute_1 a7 (.clock(clock), .element1(adder_out1), .element2(adder_out2),.new1(adder_out5));
 mult_compute_1 a8 (.clock(clock), .element1(adder_out3), .element2(adder_out4),.new1(adder_out6));
 mult_compute_1 a9 (.clock(clock), .element1(adder_out5), .element2(adder_out6),.new1(adder_out7));
 /*v_arbiter a5 (.vop1(vop1),.vop2(vop2),.vop3(vop3),.vop4(vop4), .rowno(ElementAddr),.clock(clock),.Vout(Vout),.Rowread1(Rowread1),.Rowread2(Rowread2),.Rowread3(Rowread3),.Rowread4(Rowread4));
 v_sram_op1 a6 (.clock(clock), .ReadAddress1(Rowread1), .ReadBus1(vop1));
 v_sram_op2 a7 (.clock(clock), .ReadAddress1(Rowread2), .ReadBus1(vop2));
 v_sram_op3 a8 (.clock(clock), .ReadAddress1(Rowread3), .ReadBus1(vop3));
 v_sram_op4 a9 (.clock(clock), .ReadAddress1(Rowread4), .ReadBus1(vop4));
 sync a10 (.clock(clock), .ElementY(outB), .ElementV(Vout), .SyncY(SyncY), .SyncV(SyncV));
 mult_compute a11 (.clock(clock), .element1(SyncY), .element2(SyncV), .new1(mult_output));*/


endmodule
