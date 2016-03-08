#------------------------------------------------------------
#
# Basic Synthesis Script (TCL format)
#                                  
# Revision History                
#   1/15/03  : Author Shane T. Gehring - from class example
#   2/09/07  : Author Zhengtao Yu      - from class example
#   12/14/07 : Author Ravi Jenkal      - updated to 180 nm & tcl
#
#------------------------------------------------------------

#---------------------------------------------------------
# Read in Verilog file and map (synthesize) onto a generic
# library.
# MAKE SURE THAT YOU CORRECT ALL WARNINGS THAT APPEAR
# during the execution of the read command are fixed 
# or understood to have no impact.
# ALSO CHECK your latch/flip-flop list for unintended 
# latches                                            
#---------------------------------------------------------

read_verilog $RTL_DIR/MainArbiter_1.v
read_verilog $RTL_DIR/update_1.v
read_verilog $RTL_DIR/update_2.v
read_verilog $RTL_DIR/update_3.v
read_verilog $RTL_DIR/update_3_1_3.v
read_verilog $RTL_DIR/arithController_1.v
read_verilog $RTL_DIR/pad_3.v
read_verilog $RTL_DIR/decoder.v
read_verilog $RTL_DIR/EOF_reg.v
read_verilog $RTL_DIR/Isched_2.v
read_verilog $RTL_DIR/selector.v
read_verilog $RTL_DIR/sync.v
read_verilog $RTL_DIR/syncAccum.v
read_verilog $RTL_DIR/syncDiv.v
read_verilog $RTL_DIR/syncMult.v
read_verilog $RTL_DIR/tester_2.v
read_verilog $RTL_DIR/v_arbiter.v
read_verilog $RTL_DIR/v_sched.v
read_verilog $RTL_DIR/write_enable.v
read_verilog $RTL_DIR/y_arbiter.v
#read_verilog $RTL_DIR/top_5.v
