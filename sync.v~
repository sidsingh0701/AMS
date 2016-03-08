module sync (clock, ElementY, ElementV, SyncY, SyncV);

input         clock;
input  [48:0] ElementY;
input  [47:0] ElementV;

output [48:0] SyncY;
output [47:0] SyncV;

reg    [48:0] SyncY;
reg    [47:0] SyncV;

always@(posedge clock)
begin
	SyncY <= ElementY;
	SyncV <= ElementV;
end

endmodule
