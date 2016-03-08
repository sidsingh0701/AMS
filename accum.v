module top_accum(NZE,accum_input,clock,reset,accum_out,set_bit);

input clock;
input reset;
input [47:0] accum_input;
input set_bit;
input [3:0] NZE;

output [47:0] accum_out;

controller a1 ();
addsub a2();
addsub a3();
addsub a4();
addsub a5();


endmodule;
