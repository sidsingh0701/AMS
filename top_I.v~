module top_I(clock,reset,outA,newrow);

//input [3:0] NZE;
input reset;
input clock;
input newrow;
output [191:0] outA;

wire [191:0] outA;
wire [7:0] addressI;
wire [47:0] data;

 isched a1(.clock(clock),.reset(reset),.addressI(addressI),.data(outA),.dataI(data),.NewRowFlag(newrow));
 i_sram a2(.clock(clock), .ReadAddress1(addressI),.ReadBus1(outA));

endmodule
