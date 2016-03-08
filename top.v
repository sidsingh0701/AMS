module top(clock, NewElement, X, Y, reset, EOC_Flag, EnableChange);

input reset;
input clock;
input [47:0] NewElement;
input [15:0] X;
input [15:0] Y;
input EnableChange;
output EOC_Flag;
wire   EOC_Flag;
//wire EOC_Flag;

//-------------------------Update Wires--------------------------//
//reg       clock;
//reg	  EnableChange;
//reg [15:0] X;
//reg [15:0] Y;
//reg        reset;
//reg [47:0] NewElement;

wire [10:0] ReadAddress1;
wire [10:0] ReadAddress2;
wire [10:0] WriteReq;
wire        WE;

wire [255:0] ReadBus1;
wire [255:0] ReadBus2;
wire [255:0] WriteBus;

wire [23:0] SubOutput;
wire [23:0] AddOutput;
wire [23:0] AddInput1;
wire [23:0] AddInput2;
wire [23:0] SubInput1;
wire [23:0] SubInput2;
//----------------------------------------------------------------//

//------------------------- Computation Wires ---------------------//
//----------- VSram Connection ------------//
wire [47:0] vop1;
wire [47:0] vop2;
wire [47:0] vop3;
wire [47:0] vop4;
wire [8:0] Rowread1;
wire [8:0] Rowread2;
wire [8:0] Rowread3;
wire [8:0] Rowread4;
wire       we1, we2, we3, we4;
wire [8:0] write_addr1;
wire [8:0] write_addr2;
wire [8:0] write_addr3;
wire [8:0] write_addr4;
wire [47:0] op_reg;
//-----------------------------------------//

//----------- YSram Connection ------------//
wire  [191:0] outI;
wire [7:0] addressI;
//-----------------------------------------//

//----------- Mult Connection ------------//
wire  [47:0] multinput;
wire  [47:0] op_final;
wire [47:0] SyncMultY;
wire [47:0] SyncV;
wire [47:0] op1;
wire [47:0] subOut;
wire [47:0] Mul_In;
//-----------------------------------------//

//----------- Sub Connection ------------//
wire [47:0] dataI;
wire [47:0] delay1; 
//-----------------------------------------//

//----------- Accumulator Connection ------------//
wire [23:0] adder_out1;
wire [23:0] adder_out2;
wire [23:0] adder_out3;
wire [23:0] adder_out4;
wire [23:0] adder_out5;
wire [23:0] adder_out6;
wire [23:0] adder_out7;
wire [23:0] adder_out1_imag;
wire [23:0] adder_out2_imag;
wire [23:0] adder_out3_imag;
wire [23:0] adder_out4_imag;
wire [23:0] adder_out5_imag;
wire [23:0] adder_out6_imag;
wire [23:0] adder_out7_imag;
wire [23:0] accum_output;
wire [23:0] accum_input;
wire [23:0] adder_input;
wire [23:0] accum_output_imag;
wire [23:0] accum_input_imag;
wire [23:0] adder_input_imag;
//-----------------------------------------//

//----------- Div Connection ------------//
wire [47:0] div_output;
wire [23:0] diagonalC;
wire [23:0] diagonalD;
wire [47:0] outA; 
wire [47:0] diagOut;

//-----------------------------------------//


my_design u1 (.clock(clock), .X(X), .Y(Y), .EnableChange(EnableChange), .reset(reset), .NewElement(NewElement), .ReadAddress1(ReadAddress1), .ReadAddress2(ReadAddress2), .WE(WE), .WriteReq(WriteReq), .WriteBus(WriteBus), .ReadBus1(ReadBus1), .ReadBus2(ReadBus2), .SubOutput(SubOutput), .AddOutput(AddOutput), .AddInput1(AddInput1), .AddInput2(AddInput2), .SubInput1(SubInput1), .SubInput2(SubInput2), .vop1(vop1), .vop2(vop2), .vop3(vop3), .vop4(vop4), .Rowread1(Rowread1), .Rowread2(Rowread2), .Rowread3(Rowread3), .Rowread4(Rowread4), .we1(we1), .we2(we2), .we3(we3), .we4(we4), .write_addr1(write_addr1), .write_addr2(write_addr2), .write_addr3(write_addr3), .write_addr4(write_addr4), .op_reg(op_reg), .outI(outI), .addressI(addressI), .SyncMultY(SyncMultY), .SyncV(SyncV), .multinput(multinput), .op1(op1), .subOut(subOut), .op_final(op_final), .dataI(dataI), .delay1(delay1), .adder_out7(adder_out7), .adder_out7_imag(adder_out7_imag), .adder_out1(adder_out1), .adder_out2(adder_out2), .adder_out1_imag(adder_out1_imag), .adder_out2_imag(adder_out2_imag),  .accum_output(accum_output), .accum_input(accum_input), .adder_input(adder_input), .accum_output_imag(accum_output_imag), .accum_input_imag(accum_input_imag), .adder_input_imag(adder_input_imag), .div_output(div_output), .diagonalC(diagonalC), .diagonalD(diagonalD), .adder_out3(adder_out3), .adder_out4(adder_out4), .adder_out3_imag(adder_out3_imag), .adder_out4_imag(adder_out4_imag),.EOC_Flag(EOC_Flag),.sig_OP(EOF),.diagOut(diagOut), .Mul_In(Mul_In)); 

fp_designware u2 (.clock(clock), .SyncMultY(SyncMultY), .SyncV(SyncV), .multinput(multinput), .op1(op1), .Mul_In(Mul_In), .op_final(op_final), .dataI(dataI), .delay1(delay1), .subOut(subOut), .SubInput1(SubInput1), .SubInput2(SubInput2), .SubOutput(SubOutput), .AddInput1(AddInput1), .AddInput2(AddInput2), .AddOutput(AddOutput), .adder_out1(adder_out1), .adder_out2(adder_out2), .adder_out3(adder_out3), .adder_out4(adder_out4), .adder_out7(adder_out7),  .adder_out1_imag(adder_out1), .adder_out2_imag(adder_out2_imag), .adder_out3_imag(adder_out3_imag), .adder_out4_imag(adder_out4_imag), .adder_out7_imag(adder_out7_imag), .accum_input(accum_input), .adder_input(adder_input), .accum_input_imag(accum_input_imag), .adder_input_imag(adder_input_imag), .diagonalC(diagonalC), .diagonalD(diagonalD), .diagOut(diagOut), .div_output(div_output), .accum_output_imag(accum_output_imag), .accum_output(accum_output));

memory u3 (.clock(clock), .ReadAddress1(ReadAddress1), .ReadAddress2(ReadAddress2), .ReadBus1(ReadBus1), .ReadBus2(ReadBus2), .WE(WE), .WriteReq(WriteReq), .WriteBus(WriteBus), .Rowread1(Rowread1), .Rowread2(Rowread2), .Rowread3(Rowread3), .Rowread4(Rowread4), .vop1(vop1), .vop2(vop2), .vop3(vop3), .vop4(vop4), .we1(we1), .we2(we2), .we3(we3), .we4(we4), .write_addr1(write_addr1), .write_addr2(write_addr2), .write_addr3(write_addr3), .write_addr4(write_addr4), .op_reg(op_reg), .addressI(addressI), .outI(outI));

endmodule
