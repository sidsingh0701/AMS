module y_arbiter(reset,clock,addressY,count2,EOF,MainCount, sig,EOC_Flag,CompStart);

input clock;
input CompStart;
input [2:0] count2;
input reset;
output [10:0] addressY;
input EOF;
input        sig;
output [4:0] MainCount;
output 	     EOC_Flag;

reg [10:0] addressY;
reg [2:0] count;
reg [4:0] MainCount;
reg NewFlag;
reg       HoldFlag;

wire [2:0] def;
wire select;
reg EOC_Flag;
reg CompFlag,buf2;

always@(posedge clock)
begin
	buf2 <= CompStart;	
	CompFlag <= buf2;


end

always@(posedge clock)
begin
	if(reset)
	begin
		count <= 3'd0;
		//CompFlag <= 1'b0;
	end
	else if (CompStart)
		count <= 1'b0;
	//else if (CompFlag == 1'b1)
	//	count <= 3'd1;
	else if(HoldFlag == 1'b1)
		count <= 3'd0;
	else if(!reset && !select && HoldFlag == 1'b0)
		count <= count + 3'd1;
	else
		count <= 3'd0;
end

always@(posedge clock)
begin
	if(reset)
	begin
		addressY <= 11'h3F;
		HoldFlag <= 1'b0;
	end
	else if (CompStart)
	begin
		addressY <= 11'h3F;
		HoldFlag <= 1'b0;		
	end
	else if (EOF && select)
	begin
		addressY <= 11'hxx;
		HoldFlag <= 1'b1;
	end
	else if (HoldFlag == 1'b1 && sig)
	begin
		addressY <= 11'h3f;
		HoldFlag <= 1'b0;
	end
	else if(EOC_Flag)
	begin
		addressY <= 11'h3f;
		HoldFlag <= 1'b1;
	end
	else if(!reset && select && !EOF && HoldFlag == 1'b0)
		addressY <= addressY + 1'b1;
	else
		addressY <= addressY;
end

always@(posedge clock)
begin
	if (reset)
	begin
		NewFlag <= 1'b0;
		MainCount <= 5'd20;
	end
	else if (EOC_Flag)
	begin
		MainCount <= 5'd20;
		NewFlag <= 1'b0;
	end
	else if (EOF && NewFlag == 1'b0)
	begin
		MainCount <= MainCount - 1'b1;
		NewFlag <= 1'b1;
	end
	else if (EOF == 1'b0)
		NewFlag <= 1'b0;

end

/*always@(posedge clock)
begin
	if(reset)
		EOC_Flag = 1'b0;
	else if(MainCount == 5'b0)
		EOC_Flag = 1'b1;
	else
		EOC_Flag = 1'b0;
end*/

always@(*)
begin
	EOC_Flag = ((MainCount == 5'b0) && sig);

end

assign select = (count == count2);


endmodule
