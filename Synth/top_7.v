module top_4(clock,reset, Vout, mult_output, vop1, vop2, vop3, vop4, Rowread1, Rowread2, Rowread3, Rowread4, we1, we2, we3, we4, write_addr1, write_addr2, write_addr3, write_addr4, op_reg, outI, addressI, SyncMultY, SyncV, op1 , subOut, multinput, op_final, dataI, delay1, adder_out7, adder_out7_imag, adder_out1, adder_out2, adder_out1_imag, adder_out2_imag, accum_output, accum_input, adder_input, accum_output_imag, accum_input_imag, adder_input_imag, div_output, diagonalC, diagonalD, adder_out3, adder_out4, adder_out3_imag, adder_out4_imag, X, Y, EnableChange, NewElement, ReadAddress1, ReadAddress2, WE, WriteReq, WriteBus, ReadBus1, ReadBus2, SubOutput, AddOutput, AddInput1, AddInput2, SubInput1, SubInput2,EOC_Flag,sig_OP,diagOut, Mul_In);


output sig_OP;
//output EOF;
input reset;
input clock;
output EOC_Flag;
//--------------------- Computation IO's------------------//
//-------YSRAM---------//
//input [255:0] data;
//output [10:0] addressY;
//--------------------//

//-------VSRAM--------//
input [47:0] vop1;
input [47:0] vop2;
input [47:0] vop3;
input [47:0] vop4;
output [8:0] Rowread1;
output [8:0] Rowread2;
output [8:0] Rowread3;
output [8:0] Rowread4;
output       we1, we2, we3, we4;
output [8:0] write_addr1;
output [8:0] write_addr2;
output [8:0] write_addr3;
output [8:0] write_addr4;
output [47:0] op_reg;
//---------------------//

//-------ISRAM---------//
input  [191:0] outI;
output [7:0] addressI;
//--------------------//

//-------Mult---------//
input  [47:0] multinput;
input  [47:0] op_final;
output [47:0] SyncMultY;
output [47:0] SyncV;
output [47:0] op1;
output [47:0] Mul_In;
//output [47:0] subOut;
//--------------------//

//-------Sub----------//
output [47:0] dataI;
output [47:0] delay1;
input  [47:0] subOut; 
//--------------------//

//--------Accumulator ----------//
input  [23:0] adder_out7;
input  [23:0] adder_out7_imag;
input  [23:0] accum_output;
input  [23:0] accum_output_imag;

output [23:0] accum_input;
output [23:0] adder_input;
output [23:0] accum_input_imag;
output [23:0] adder_input_imag;
output [23:0] adder_out1;
output [23:0] adder_out2;
output [23:0] adder_out1_imag;
output [23:0] adder_out2_imag;
output [23:0] adder_out3;
output [23:0] adder_out4;
output [23:0] adder_out3_imag;
output [23:0] adder_out4_imag;

//------------------------------//

//-------Div----------//
input  [47:0] div_output;

output [23:0] diagonalC;
output [23:0] diagonalD;
output [47:0] diagOut; 
reg [47:0] diagOut;

//--------------------//

output [47:0] Vout;
//output [47:0] SyncY;
output [48:0] mult_output;
//-----------------------------------------------------------//

//------------------- Update IO's ---------------------------//
input [15:0] X;
input [15:0] Y;
input       EnableChange;
input [47:0] NewElement;
input  [255:0] ReadBus1;
input  [255:0] ReadBus2;
input  [23:0] SubOutput;
input  [23:0] AddOutput;

output [10:0] ReadAddress1;
output [10:0] ReadAddress2;
output        WE;
output [10:0] WriteReq;
output [255:0] WriteBus;
output [23:0] AddInput1;
output [23:0] AddInput2;
output [23:0] SubInput1;
output [23:0] SubInput2;

//-----------------------------------------------------------//

//--------------- Update Wires ----------------//
wire [47:0] DiagonalX;
wire [47:0] DiagonalY;
wire [47:0] ElementUpdate;
wire [12:0] PosRowX;
wire [12:0] PosRowY;
wire [12:0] PosDX;
wire [12:0] PosDY;
wire [10:0] Row_noX;
wire [10:0] Row_noY;
wire [10:0] Y_ramX;
wire [10:0] Y_ramY;
wire [255:0] RowX;
wire [255:0] RowY;
wire [255:0] NewRowX;
wire [255:0] NewRowY;
wire [47:0]  NewDiagonalX;
wire [47:0]  NewDiagonalY;
wire         WE;
wire [1:0]   FoundX;
wire [1:0]   FoundY;
wire         EnableColX;
wire         EnableColY;
wire         DiagonalDoneX;
wire         DiagonalDoneY;
wire         NewRowFetchX;
wire         NewRowFetchY;
wire         DiagonalXDone;
wire         DiagonalYDone;
wire  [10:0]  ReadAddress1;
wire  [10:0]  ReadAddress2;
wire          FlagX;
wire          FlagY;
wire   [47:0]  ArbiterElement;
wire   [12:0]  ArbiterPos;
wire   [255:0] OutputPaddedRow;
wire   [255:0] WriteBus;
wire   [255:0] PaddedRow;
wire   [10:0]  WriteReq;
wire   [23:0] AddInput1;
wire   [23:0] AddInput2;
wire   [23:0] SubInput1;
wire   [23:0] SubInput2;
//---------------------------------------------//

//--------- Computation Wires -------------------//
reg  [47:0] Element;
reg [48:0] reg_outB;
wire [2:0] count;
wire found1,found2,found3,found4;
wire [47:0] outA;
wire [48:0] outB;
wire [10:0] addressY;
wire [10:0] ElementAddr;
wire [8:0]  Rowread1;
wire [8:0]  Rowread2;
wire [8:0]  Rowread3;
wire [8:0]  Rowread4;
wire [47:0] Vout;
wire [48:0] SyncY;
wire [47:0] SyncV;
wire [48:0] mult_output;
wire [23:0] adder_input;
wire [24:0] adder_output;
wire [23:0] adder_input_imag;
wire [24:0] adder_output_imag;
wire [23:0] adder_out1;
wire [23:0] adder_out2;
wire [23:0] adder_out1_imag;
wire [23:0] adder_out2_imag;
wire [7:0] addressI;
wire [191:0] outI;
wire [47:0] dataI;
reg [47:0] delay1;
//wire [47:0] subOut;
wire [47:0] diagonal_output;
wire [47:0] op1;
wire signal;
wire [8:0] write_addr1,write_addr2,write_addr3,write_addr4;
wire we1,we2,we3,we4;
reg [47:0] op_reg;
wire signal2;
wire signal_I;
wire sig;
wire EOF;
wire [4:0] MainCount1;
wire sig_OP;
wire OP;
wire [47:0] SyncMultY;
wire [23:0] accum_input;
wire [23:0] diagonalC;
wire [23:0] diagonalD;
wire [47:0] Mul_In;
//---------------------------------------------------//

//------------------Merge Wires----------------------//
wire [10:0] ComputeReq;
wire [255:0] OutputCompute;
wire         CompStart;
wire EOC_Flag;
wire WireX;
wire WireY;
reg [47:0] delay2;
//---------------------------------------------------//


reg [47:0] d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d40;



 update_1   u2 (X, Y, Y_ramX, Y_ramY);

 update_2   u4 (.X(X), .Y(Y), .RowX(RowX), .RowY(RowY), .Y_ramX(Y_ramX), .Y_ramY(Y_ramY), .Row_noX(Row_noX), .Row_noY(Row_noY), .clock(clock), .EnableChange(EnableChange), .FoundX(FoundX),.FoundY(FoundY), .FlagX(FlagX), .FlagY(FlagY), .DiagonalDoneX(DiagonalDoneX), .DiagonalDoneY(DiagonalDoneY), .WireX(WireX), .WireY(WireY));

 MainArbiter_1 u15 (.reset(reset), .clock(clock), .EnableChange(EnableChange), .Update_1Req1(Y_ramX), .Update_1Req2(Y_ramY), .Update_2Req1(Row_noX), .Update_2Req2(Row_noY), .Row1(ReadBus1), .Row2(ReadBus2), .OutputReq1(ReadAddress1), .OutputReq2(ReadAddress2), .Output_1Row1(RowX), .Output_1Row2(RowY), .Output_2Row1(NewRowX), .Output_2Row2(NewRowY), .FlagX(FlagX), .FlagY(FlagY),.DiagonalDoneX(DiagonalXDone), .DiagonalDoneY(DiagonalYDone), .WE(WE), .PosDX(PosDX), .PaddedRow(PaddedRow), .WriteReq(WriteReq), .WriteBus(WriteBus), .NewDiagonalX(NewDiagonalX), .NewDiagonalY(NewDiagonalY), .NewElement(NewElement), .ArbiterElement(ArbiterElement), .ArbiterPos(ArbiterPos), .OutputPaddedRow(OutputPaddedRow), .PosDY(PosDY), .PosRowX(PosRowX), .PosRowY(PosRowY), .ComputeReq(ComputeReq), .OutputCompute(OutputCompute), .CompStart(CompStart),.EOC_Flag(EOC_Flag));


 update_3   u6 (.reset(reset), .clock(clock), .X(X), .Y(Y), .NewRowX(NewRowX), .NewRowY(NewRowY), .DiagonalX(DiagonalX), .DiagonalY(DiagonalY), .PosDX(PosDX), .PosDY(PosDY), .DiagonalDoneX(DiagonalDoneX), .DiagonalDoneY(DiagonalDoneY), .Row_noX(Row_noX), .Row_noY(Row_noY), .EnableChange(EnableChange));

 update_3_1 u7 (.clock(clock), .X(X), .Y(Y), .NewRowX(NewRowX), .NewRowY(NewRowY),.Element(ElementUpdate), .PosRowX(PosRowX), .PosRowY(PosRowY), .PosDX(PosDX), .PosDY(PosDY), .FoundX(FoundX), .FoundY(FoundY), .Row_noX(Row_noX), .Row_noY(Row_noY),.reset(reset), .DiagonalDoneX(DiagonalDoneX), .DiagonalDoneY(DiagonalDoneY), .EnableChange(EnableChange), .WireX(WireX), .WireY(WireY));

 arithController u8 (.clock(clock), .reset(reset), .DiagonalX(DiagonalX), .DiagonalY(DiagonalY), .Element(ElementUpdate), .NewElement(NewElement), .AddInput1(AddInput1), .AddInput2(AddInput2), .SubInput1(SubInput1), .SubInput2(SubInput2), .SubOutput(SubOutput), .AddOutput(AddOutput), .DiagonalXDone(DiagonalXDone), .DiagonalYDone(DiagonalYDone), .NewDiagonalX(NewDiagonalX), .NewDiagonalY(NewDiagonalY), .EnableChange(EnableChange));

 pad_3 u11 (.Element(ArbiterElement), .PosElement(ArbiterPos), .Y_ramRow(OutputPaddedRow), .PaddedRow(PaddedRow));

//--------------------------------------------------------------------------------------------------------------------------------------------------------//

 selector a1 (.dataY(OutputCompute),.count(count),.found1(found1),.found2(found2),.found3(found3),.found4(found4),.EOF(EOF));

 EOF_reg a31(.clock(clock),.reset(reset),.EOF(EOF),.OP(OP),.sig(sig_OP));

 y_arbiter a2 (.reset(reset),.clock(clock),.addressY(ComputeReq),.count2(count),.EOF(EOF),.MainCount(MainCount1), .sig(sig_OP),.EOC_Flag(EOC_Flag),.CompStart(CompStart));

 decoder a3 (.clock(clock), .reset(reset), .data(OutputCompute), .Diagonal(outA), .Element(outB), .ElementAddr(ElementAddr),.EOF(EOF),.sig(sig_OP), .CompStart(CompStart));

 v_arbiter a5 (.vop1(vop1),.vop2(vop2),.vop3(vop3),.vop4(vop4), .rowno(ElementAddr),.clock(clock),.Vout(Vout),.Rowread1(Rowread1),.Rowread2(Rowread2),.Rowread3(Rowread3),.Rowread4(Rowread4),.count2(MainCount1[0]));

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
	
	d16 <= subOut;
	d17 <= d16;
	d18 <= d17;
	d19 <= d18;
	//d20 <= d19;
end

assign op1 = div_output;
assign Mul_In = d19;

 sync a10 (.clock(clock), .ElementY(outB), .ElementV(Vout), .SyncY(SyncY), .SyncV(SyncV));

 syncDiv a9 (.element1(diagOut), .op1(diagonalC), .op2(diagonalD), .clock(clock));

// diagonal_pipeline a21(.clock(clock),.input_diagonal(div_output),.output_diagonal(diagonal_output));

 syncMult a4 (.clock(clock), .SyncY(SyncY), .SyncMultY(SyncMultY), .multinput(multinput), .mult_output(mult_output));

 controller2 a12 (.clock(clock),.reset(reset), .accum_in(adder_output), .feedback(adder_input),.set_bit(mult_output[48]), .element(mult_output[48:24]),.adder_out1(adder_out1),.adder_out2(adder_out2),.adder_out3(adder_out3),.adder_out4(adder_out4));

 syncAccum a14 (.clock(clock), .mult_output(mult_output[48:24]), .accum_input(accum_input), .accum_output(accum_output), .accum_output25(adder_output));

 controller2 a26 (.clock(clock),.reset(reset), .accum_in(adder_output_imag), .feedback(adder_input_imag),.set_bit(mult_output[48]), .element({mult_output[48],mult_output[23:0]}),.adder_out1(adder_out1_imag),.adder_out2(adder_out2_imag),.adder_out3(adder_out3_imag),.adder_out4(adder_out4_imag));

 syncAccum a15 (.clock(clock), .mult_output({mult_output[48],mult_output[23:0]}), .accum_input(accum_input_imag), .accum_output(accum_output_imag), .accum_output25(adder_output_imag));

always@(posedge clock)
begin
	delay1 <= {adder_out7,adder_out7_imag};
	//delay1 <= delay2;

end
 isched a17(.clock(clock),.reset(reset),.addressI(addressI),.data(outI),.dataI(dataI), .FinalOutput(adder_out7), .sig(sig_OP));
 //check a22(.input1(subOut),.input2(diagonal_output),.output_final(op1));
 always@(posedge clock)
 begin
	op_reg <= op_final;
 end
 write_enable a24(.input_data(op_final),.input_data2(op_reg),.signal(signal),.signal2(signal2));
 v_sched a25(.signal(signal),.signal2(signal2),.clock(clock),.reset(reset),.write_addr1(write_addr1),.we1(we1),.write_addr2(write_addr2),.we2(we2),.write_addr3(write_addr3),.we3(we3),.write_addr4(write_addr4),.we4(we4),.sig_I(sig_OP),.count2(MainCount1[0]));

endmodule
