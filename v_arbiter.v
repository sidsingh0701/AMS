module v_arbiter(vop1,vop2,vop3,vop4,rowno,clock,Vout,Rowread1,Rowread2,Rowread3,Rowread4,count2);

input clock;
input count2;
input [10:0] rowno;
input [47:0] vop1;
input [47:0] vop2;
input [47:0] vop3;
input [47:0] vop4;
output [47:0] Vout;
output [8:0] Rowread1;
output [8:0] Rowread2;
output [8:0] Rowread3;
output [8:0] Rowread4;

//reg request1,request2,request3,request4;
reg [8:0] Rowread1;
reg [8:0] Rowread2;
reg [8:0] Rowread3;
reg [8:0] Rowread4;

wire [1:0] select;
wire [10:0] Rowread;

reg [47:0] Vout;


assign select = rowno[1:0];
assign Rowread = count2?((rowno>>2'd2)+11'h100):(rowno >> 2'd2);

always@(*)
begin
	Rowread1 = 11'hx;
	Rowread2 = 11'hx;
	Rowread3 = 11'hx;
	Rowread4 = 11'hx;
	Vout = 48'b0;
	//request1 = 1'b0;request2 = 1'b0;request3 = 1'b0;request4 = 1'b0;
	if(select == 2'b00)
	begin
		//request1 = 1'b1;
		Rowread1 = Rowread[8:0];
		Vout = vop1;
	end
	else if(select == 2'b01)
	begin
		//request2 = 1'b1;
		Rowread2 = Rowread[8:0];
		Vout = vop2;
	end
	else if(select == 2'b10)
	begin
		//request3 = 1'b1;
		Rowread3 = Rowread[8:0];
		Vout = vop3;
	end
	else
	begin
		//request4 = 1'b1;
		Rowread4 = Rowread[8:0];
		Vout = vop4;
	end
end

/*
always @(*)
begin
	Rowread1 = 11'hx;
	Rowread2 = 11'hx;
	Rowread3 = 11'hx;
	Rowread4 = 11'hx;
	if(request1 == 1'b1)
		Rowread1 = Rowread;
	if(request2 == 1'b1)
		Rowread2 = Rowread;
	if(request3 == 1'b1)
		Rowread3 = Rowread;
	if(request4 == 1'b1)
		Rowread4 = Rowread;
end


always @(*)
begin
	Vout = 48'b0;	
	if(request1 == 1'b1)
		Vout = vop1;
	if(request2 == 1'b1)
		Vout = vop2;
	if(request3 == 1'b1)
		Vout = vop3;
	if(request4 == 1'b1)
		Vout = vop4;
end
*/
endmodule
