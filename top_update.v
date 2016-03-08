module top_1 (clock, X, Y, EnableChange, reset, NewElement, ReadAddress1, ReadAddress2, WE, WriteReq, WriteBus, ReadBus1, ReadBus2, SubOutput, AddOutput, AddInput1, AddInput2, SubInput1, SubInput2);

input       clock;
input [15:0] X;
input [15:0] Y;
input       EnableChange;
input       reset;
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


wire [47:0] DiagonalX;
wire [47:0] DiagonalY;
wire [47:0] Element;
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
wire   [48:0]  ArbiterElement;
wire   [12:0]  ArbiterPos;
wire   [255:0] OutputPaddedRow;
wire   [255:0] WriteBus;
wire   [255:0] PaddedRow;
wire   [10:0]  WriteReq;
wire   [23:0] AddInput1;
wire   [23:0] AddInput2;
wire   [23:0] SubInput1;
wire   [23:0] SubInput2;


update_1   u2 (X, Y, Y_ramX, Y_ramY);

update_2   u4 (.X(X), .Y(Y), .RowX(RowX), .RowY(RowY), .Y_ramX(Y_ramX), .Y_ramY(Y_ramY), .Row_noX(Row_noX), .Row_noY(Row_noY), .clock(clock), .EnableChange(EnableChange), .FoundX(FoundX),.FoundY(FoundY), .FlagX(FlagX), .FlagY(FlagY), .DiagonalDoneX(DiagonalDoneX), .DiagonalDoneY(DiagonalDoneY));

MainArbiter_1 u15 (.reset(reset), .clock(clock), .EnableChange(EnableChange), .Update_1Req1(Y_ramX), .Update_1Req2(Y_ramY), .Update_2Req1(Row_noX), .Update_2Req2(Row_noY), .Row1(ReadBus1), .Row2(ReadBus2), .OutputReq1(ReadAddress1), .OutputReq2(ReadAddress2), .Output_1Row1(RowX), .Output_1Row2(RowY), .Output_2Row1(NewRowX), .Output_2Row2(NewRowY), .FlagX(FlagX), .FlagY(FlagY),.DiagonalDoneX(DiagonalXDone), .DiagonalDoneY(DiagonalYDone), .WE(WE), .PosDX(PosDX), .PaddedRow(PaddedRow), .WriteReq(WriteReq), .WriteBus(WriteBus), .NewDiagonalX(NewDiagonalX), .NewDiagonalY(NewDiagonalY), .NewElement(NewElement), .ArbiterElement(ArbiterElement), .ArbiterPos(ArbiterPos), .OutputPaddedRow(OutputPaddedRow), .PosDY(PosDY), .PosRowX(PosRowX), .PosRowY(PosRowY));


update_3   u6 (.reset(reset), .clock(clock), .X(X), .Y(Y), .NewRowX(NewRowX), .NewRowY(NewRowY), .DiagonalX(DiagonalX), .DiagonalY(DiagonalY), .PosDX(PosDX), .PosDY(PosDY), .DiagonalDoneX(DiagonalDoneX), .DiagonalDoneY(DiagonalDoneY), .Row_noX(Row_noX), .Row_noY(Row_noY), .EnableChange(EnableChange));

update_3_1 u7 (.clock(clock), .X(X), .Y(Y), .NewRowX(NewRowX), .NewRowY(NewRowY),.Element(Element), .PosRowX(PosRowX), .PosRowY(PosRowY), .PosDX(PosDX), .PosDY(PosDY), .FoundX(FoundX), .FoundY(FoundY), .Row_noX(Row_noX), .Row_noY(Row_noY),.reset(reset), .DiagonalDoneX(DiagonalDoneX), .DiagonalDoneY(DiagonalDoneY), .EnableChange(EnableChange));

arithController u8 (.clock(clock), .reset(reset), .DiagonalX(DiagonalX), .DiagonalY(DiagonalY), .Element(Element), .NewElement(NewElement), .AddInput1(AddInput1), .AddInput2(AddInput2), .SubInput1(SubInput1), .SubInput2(SubInput2), .SubOutput(SubOutput), .AddOutput(AddOutput), .DiagonalXDone(DiagonalXDone), .DiagonalYDone(DiagonalYDone), .NewDiagonalX(NewDiagonalX), .NewDiagonalY(NewDiagonalY), .EnableChange(EnableChange));

pad_3 u11 (.Element(ArbiterElement), .PosElement(ArbiterPos), .Y_ramRow(OutputPaddedRow), .PaddedRow(PaddedRow));


endmodule
