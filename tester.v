module controller2(clock,reset,accum_in,feedback,set_bit,count,count2,count3, element);

//input [3:0] NZE;
input [24:0] element;
input reset;
input clock;
input [24:0] accum_in;
input set_bit;

output [24:0] feedback;
output [3:0] count,count3;
output [2:0] count2;

reg [3:0] count;
reg [2:0] count2;
reg [3:0] count3;
reg [24:0] reg1,reg2,reg3,reg4;
reg [23:0] feedback;


always@(posedge clock)
begin
	if(reset)
		count <= 4'b0;
	else if (element == 25'h0)
		count <= 4'b0000;
	else if(set_bit)	
		count <= 4'b0001;
	else if(!set_bit)
		count <= count + 1'b1;
end


always@(posedge clock)
begin
	if(reset)
	begin
		count2 <= 3'b000;
		feedback <= 24'b0;
	end
	else if (element == 25'b0)
	begin
		feedback <= 24'b0;
		count2 <= 3'b000;
	end
	else if(set_bit)
	begin	
		feedback <= 24'b0;
		count2 <= 3'b000;
	end
	else if((count == 3'b100) && (!set_bit))
	begin
		feedback <= accum_in[23:0];
		count2 <= 3'b001;
	end
	else if((count2 == 3'b001) && (!set_bit))
	begin
		feedback <= accum_in[23:0];
		count2 <= 3'b001;
	end	
end

always@(posedge clock)
begin
	if(reset)
	begin
		reg1 <= 25'b0;
		reg2 <= 25'b0;
		reg3 <= 25'b0;
		reg4 <= 25'b0;
		count3 <= 3'b000;
	end
	else if(accum_in[24] || (accum_in == 25'h0))
	begin
		reg1 <= accum_in;
		reg2 <= 25'b0;
		reg3 <= 25'b0;
		reg4 <= 25'b0;
		count3 <= 3'b010;
	end
	else if(!accum_in[24] && (count3[1:0] == 2'b01))
	begin
		reg1 <= accum_in;
		count3 <= count3+1'b1;
	end
	else if(!accum_in[24] && (count3[1:0] == 2'b10))
	begin
		reg2 <= accum_in;
		count3 <= count3+1'b1;
	end
	else if(!accum_in[24] && (count3[1:0] == 2'b11))
	begin	
		reg3 <= accum_in;
		count3 <= count3+1'b1;
	end
	else if(!accum_in[24] && (count3[1:0] == 2'b00))
	begin
		reg4 <= accum_in;		
		count3 <= count3+1'b1;
	end
end
endmodule
