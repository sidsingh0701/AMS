    // synopsys translate_off
`include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW_fp_addsub.v"
     //synopsys translate_on

module arith( clock, inst_a, inst_b, inst_rnd, inst_op, z_inst, status_inst);

parameter sig_width = 17;
parameter exp_width = 6;
parameter ieee_compliance = 0;

input clock;
input [sig_width+exp_width : 0] inst_a;
input [sig_width+exp_width : 0] inst_b;
input [2 : 0] inst_rnd;
input inst_op;

output [sig_width+exp_width : 0] z_inst;
output [7 : 0] status_inst;

reg [sig_width+exp_width : 0] inst_a_reg;
reg [sig_width+exp_width : 0] inst_b_reg;
reg [2 : 0] inst_rnd_reg;
reg inst_op_reg;

reg   [sig_width+exp_width : 0] z_inst_pipe1, z_inst_pipe2, z_inst_pipe3, z_inst_pipe4;
wire  [sig_width+exp_width : 0] z_inst_internal;

reg   [7 : 0] status_inst_pipe1, status_inst_pipe2, status_inst_pipe3, status_inst_pipe4;
wire  [7 : 0] status_inst_internal;

// Instantiate the DesignWare IP Core
    DW_fp_addsub #(sig_width, exp_width, ieee_compliance)
	  U1 ( .a(inst_a_reg), .b(inst_b_reg), .rnd(inst_rnd_reg), .op(inst_op_reg), .z(z_inst_internal), .status(status_inst_internal));

  always @(posedge clock) begin
// synchronize the input to clock edge
    inst_a_reg <= inst_a;
    inst_b_reg <= inst_b;
    inst_rnd_reg <= inst_rnd;
    inst_op_reg <= inst_op;

//output to be registered by allowing 4 pipeline stages to be moved

    z_inst_pipe1 <= z_inst_internal;
    z_inst_pipe2 <= z_inst_pipe1;
    z_inst_pipe3 <= z_inst_pipe2;
    //z_inst_pipe4 <= z_inst_pipe3;

    status_inst_pipe1 <= status_inst_internal;
    status_inst_pipe2 <= status_inst_pipe1;
    status_inst_pipe3 <= status_inst_pipe2;
    //status_inst_pipe4 <= status_inst_pipe3;

  end

 assign z_inst = z_inst_pipe3;               
 assign status_inst = status_inst_pipe3;

endmodule
