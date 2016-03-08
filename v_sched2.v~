module v_sched(signal,signal2,clock,reset,write_addr1,we1,write_addr2,we2,write_addr3,we3,write_addr4,we4,sig_I,count2,input_data,input_data2);

input signal;
input signal2;
input clock;
input reset;
input sig_I;
input count2;
input [47:0] input_data;
input [47:0] input_data2;

output [8:0] write_addr1,write_addr2,write_addr3,write_addr4;
output we1,we2,we3,we4;

reg [8:0] write_addr1,write_addr2,write_addr3,write_addr4;
reg we1,we2,we3,we4;
reg we;

reg [2:0] count;
reg [8:0] addressV;

always@(posedge clock)
begin
	if(reset)
	begin
		count <= 3'b000;
		addressV <= 9'h100;
		we <= 1'b0;
	end
	if(sig_I && count2)
	begin
		count <= 3'b000;
		addressV <= 9'h0;
		we <= 1'b0;
	end
	else if(sig_I && !count2)
	begin
		count <= 3'b000;
		addressV <= 9'h100;
		we <= 1'b0;
	end
	else if(count < 3'b101 && (input_data != 48'b0 && input_data != 48'h800000000000))
	begin
		count <= count + 1'b1;
		addressV <= addressV;
		if(count == 3'b000)
		begin
			we1 <= 1'b1;
			we2 <= 1'b0;
			we3 <= 1'b0;
			we4 <= 1'b0;
		end
		if(count == 3'b001)
		begin
			we2 <= 1'b1;
			we1 <= 1'b0;
			we3 <= 1'b0;
			we4 <= 1'b0;
		end
		if(count == 3'b010)
		begin
			we3 <= 1'b1;
			we1 <= 1'b0;
			we2 <= 1'b0;
			we4 <= 1'b0;
		end
		if(count == 3'b011)
		begin
			we4 <= 1'b1;
			we1 <= 1'b0;
			we2 <= 1'b0;
			we3 <= 1'b0;
		end
		if(count == 3'b100)
		begin
			we4 <= 1'b0;
			we1 <= 1'b1;
			we2 <= 1'b0;
			we3 <= 1'b0;
			addressV <= addressV + 1'b1;
			count <= 3'b001;
		end
	end
	else if(count < 3'b101)
	begin
		if(count == 3'b001)
			we1 <= 1'b0;
		if(count == 3'b010)
			we2 <= 1'b0;
		if(count == 3'b011)
			we3 <= 1'b0;
		if(count == 3'b100)
		begin
			we4 <= 1'b0;
			count <= 3'b000;
			addressV <= addressV + 1'b1;		
		end
	end
end

always@(*)
begin
	write_addr1 = 9'hx;write_addr2 = 9'hx; write_addr3 = 9'hx;write_addr4 = 9'hx;
	//we1 = 1'b0;we2 = 1'b0;we3 = 1'b0;we4 = 1'b0;
	if(count == 3'b001 && (input_data2 != 48'b0 && input_data2 != 48'h800000000000))
	begin
		write_addr1 = addressV;
		//we1 = we;
	end
	else if(count == 3'b010 && (input_data2 != 48'b0 && input_data2 != 48'h800000000000))
	begin
		write_addr2 = addressV;
		//we2 = we;
	end
	else if(count == 3'b011 && (input_data2 != 48'b0 && input_data2 != 48'h800000000000))
	begin
		write_addr3 = addressV;
	//	we3 = we;
	end
	else if(count == 3'b100 && (input_data2 != 48'b0 && input_data2 != 48'h800000000000))
	begin
		write_addr4 = addressV;
		//we4 = we;
	end
end

endmodule
