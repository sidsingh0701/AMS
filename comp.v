module update_computation (reset, clock, DiagonalX, DiagonalY, Element, NewElement, NewDiagonalX, NewDiagonalY, DiagonalXDone, DiagonalYDone);

input         reset;
input         clock;
input [47:0]  DiagonalX;
input [47:0]  DiagonalY;
input [47:0]  Element;
input [47:0]  NewElement;
//input         EnableChange;

output [47:0] NewDiagonalX;
output [47:0] NewDiagonalY;
output        DiagonalXDone;
output        DiagonalYDone;


wire [47:0] NewDiagonalX;
wire [47:0] NewDiagonalY;
wire        DiagonalXDone;
wire        DiagonalYDone;

wire   [23:0] AddInput1;
wire   [23:0] AddInput2;
wire   [23:0] SubInput1;
wire   [23:0] SubInput2;
wire   [23:0] AddOutput;
wire   [23:0] SubOutput;

arithController u1 (.clock(clock), .reset(reset), .DiagonalX(DiagonalX), .DiagonalY(DiagonalY), .Element(Element), .NewElement(NewElement), .AddInput1(AddInput1), .AddInput2(AddInput2), .SubInput1(SubInput1), .SubInput2(SubInput2), .SubOutput(SubOutput), .AddOutput(AddOutput), .DiagonalXDone(DiagonalXDone), .DiagonalYDone(DiagonalYDone));

arith u2 (.clock(clock), .inst_a(SubInput1), .inst_b(SubInput2), .inst_rnd(3'b000), .inst_op(1'b1), .z_inst(SubOutput)); // Subtraction to get the difference

arith u3 (.clock(clock), .inst_a(AddInput1), .inst_b(AddInput2), .inst_rnd(3'b000), .inst_op(1'b0), .z_inst(AddOutput)); // Computation for change in diagonalX

endmodule

