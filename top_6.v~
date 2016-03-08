module top_4(clock,addressY,reset, Vout, SyncY, SyncV, mult_output,adder_out7);

input reset;
input clock;
output [10:0] addressY;
//output [47:0] outA,outB;
output [47:0] Vout;
output [47:0] SyncY;
output [47:0] SyncV;
output [48:0] mult_output;
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
wire [48:0] SyncY;
wire [47:0] SyncV;
wire [48:0] mult_output;
wire [23:0] adder_input;
wire [24:0] adder_output;
wire [23:0] adder_out1,adder_out2,adder_out3,adder_out4;
wire [23:0] adder_out5,adder_out6,adder_out7;
wire [7:0] addressI;
wire [191:0] outI;
wire [23:0] dataI;
reg [23:0] delay1,delay2;
wire [23:0] subOut;
wire [47:0] div_output;
wire [47:0] diagonal_output;
reg [47:0] temp1,temp2,temp3,temp4,temp5;
wire [47:0] op1;
wire [23:0] op_final;
wire signal;
wire [8:0] write_addr1,write_addr2,write_addr3,write_addr4;
wire we1,we2,we3,we4;

 selector a1 (.dataY(data),.count(count),.found1(found1),.found2(found2),.found3(found3),.found4(found4));
 y_arbiter a2 (.reset(reset),.clock(clock),.addressY(addressY),.count2(count));
 decoder a3 (.clock(clock), .reset(reset), .data(data), .Diagonal(outA), .Element(outB), .ElementAddr(ElementAddr));
 y_sram a4 (.clock(clock),.ReadAddress1(addressY),.ReadBus1(data));
 v_arbiter a5 (.vop1(vop1),.vop2(vop2),.vop3(vop3),.vop4(vop4), .rowno(ElementAddr),.clock(clock),.Vout(Vout),.Rowread1(Rowread1),.Rowread2(Rowread2),.Rowread3(Rowread3),.Rowread4(Rowread4));
 v_sram_op1 a6 (.clock(clock), .ReadAddress1(Rowread1), .ReadBus1(vop1),.WE(we1),.WriteAddress1(write_addr1),.WriteBus1({op_final,op_final}), .WriteAddress2(write_addr1),.WriteBus2({op_final,op_final}));
 v_sram_op2 a7 (.clock(clock), .ReadAddress1(Rowread2), .ReadBus1(vop2),.WE(we2),.WriteAddress1(write_addr2),.WriteBus1(op_final));
 v_sram_op3 a8 (.clock(clock), .ReadAddress1(Rowread3), .ReadBus1(vop3),.WE(we3),.WriteAddress1(write_addr3),.WriteBus1(op_final));
 v_sram_op4 a9 (.clock(clock), .ReadAddress1(Rowread4), .ReadBus1(vop4),.WE(we4),.WriteAddress1(write_addr4),.WriteBus1(op_final));
 sync a10 (.clock(clock), .ElementY(outB), .ElementV(Vout), .SyncY(SyncY), .SyncV(SyncV));
 div_compute a20(.clock(clock),.element1(outA),.new1(div_output));
 diagonal_pipeline a21(.clock(clock),.input_diagonal(div_output),.output_diagonal(diagonal_output));
always @(posedge clock)
 begin
	temp1 <= diagonal_output;
	temp2 <= temp1;
	temp3 <= temp2;
	temp4 <= temp3;
	temp5 <= temp4;
 end
 multiply a11 (.clock(clock), .element1(SyncY), .element2(SyncV), .new1(mult_output));
always @(posedge clock)
 begin
	reg_outB <= mult_output[48:24];
 end
 controller2 a12 (.clock(clock),.reset(reset), .accum_in(adder_output), .feedback(adder_input),.set_bit(mult_output[48]), .element(mult_output[48:24]),.adder_out1(adder_out1),.adder_out2(adder_out2),.adder_out3(adder_out3),.adder_out4(adder_out4));
 mult_compute a13 (.clock(clock), .element1(reg_outB), .element2(adder_input),.new1(adder_output));
 mult_compute_1 a14 (.clock(clock), .element1(adder_out1), .element2(adder_out2),.new1(adder_out5));
 mult_compute_1 a15 (.clock(clock), .element1(adder_out3), .element2(adder_out4),.new1(adder_out6));
 mult_compute_1 a16 (.clock(clock), .element1(adder_out5), .element2(adder_out6),.new1(adder_out7));
always@(posedge clock)
begin
	delay1 <= adder_out7;

end
 isched a17(.clock(clock),.reset(reset),.addressI(addressI),.data(outI),.dataI(dataI), .FinalOutput(adder_out7),.temp_output(delay1));
 i_sram a18(.clock(clock), .ReadAddress1(addressI),.ReadBus1(outI));
 sub1 a19(.clock(clock), .element1(dataI), .element2(delay1),.new1(subOut));
 check a22(.input1(subOut),.input2(diagonal_output[47:24]),.output_final(op1));
 single_mult a23(.clock(clock),.operand1(op1),.operand2(subOut),.output_final(op_final));
 write_enable a24(.input_data(op_final),.signal(signal));
 v_sched a25(.signal(signal),.clock(clock),.reset(reset),.write_addr1(write_addr1),.we1(we1),.write_addr2(write_addr2),.we2(we2),.write_addr3(write_addr3),.we3(we3),.write_addr4(write_addr4),.we4(we4));
endmodule
