`timescale 1ns/100ps
module test_sram;



//-------------------------Update Wires--------------------------//
reg       clock;
reg	  EnableChange;
reg [15:0] X;
reg [15:0] Y;
reg        reset;
reg [47:0] NewElement;

wire EOC_Flag;


integer fd,sf,n1,n2,n3,n4,i,I,v_write_pointer;
reg [128*8:1] str;
reg [47:0] mask;
reg [47:0] check;
reg [15:0] XC,YC;
reg [23:0] MEM [39:0]; 
reg [47:0] vtest [999:0];

reg FLAG;
wire EOF;


//reg [255:0] ReadBus1;
//reg [255:0] ReadBus2;

initial
	begin
		v_write_pointer = $fopen("test_secret.txt","w");
		fd = $fopen("change_data_secret.txt","r");
		$readmemh("change_data_secret.txt",MEM);
		n1 = 0;
		while($fgets(str,fd)) begin
			n1 = n1+1;
		end
		n1 = n1-1;
		n4 = 0;
		$fclose(fd);
		i = 0;
		reset = 1'b1;
		clock = 1'b0;
		#10 reset = 1'b0;
		
		FLAG = 1'b0;
		EnableChange = 1'b1;
		X = MEM[i];
		Y = MEM[i+1];
		NewElement[47:24] = MEM[i+2];
		NewElement[23:0] = MEM[i+3];
		i= i+4;

		
		#10 EnableChange = 1'b0;
	
		
	     /*   #1000 FLAG = 1'b1;
		#10 FLAG = 1'b0; 
	        #1000 FLAG = 1'b1;
		#10 FLAG = 1'b0;
	        #1000 FLAG = 1'b1;
		#10 FLAG = 1'b0;		
	        #1000 FLAG = 1'b1;
		#10 FLAG = 1'b0;		
	        #1000 FLAG = 1'b1;
		#10 FLAG = 1'b0;*/
		//$fclose(v_write_pointer);
	end

	always@(posedge clock)
	begin
		
	  if(n4 < n1 && EOC_Flag == 1'b1)
	  begin	
		EnableChange = 1'b1;	
		X = MEM[i];
		Y = MEM[i+1];
		NewElement[47:24] = MEM[i+2];
		NewElement[23:0] = MEM[i+3];
		i = i+4;
		n4 = n4 + 1;
	 end			
	 else if(EOC_Flag == 1'b0)
	 begin
		EnableChange = 1'b0;	
	 end	
	end
	
/*always@(EOC_Flag)

	begin
		if(EOC_Flag)
		begin
			//$writememh("v1.txt", a6.Register);
			//FLAG = 1'b1;
			//$writememh("v2.txt", a7.Register);
			//$writememh("v3.txt", a8.Register);
			//$writememh("v4.txt", a9.Register);		
		end
	end*/	
	
	always@(*)
        begin
   	 if(EOC_Flag)
      begin
	  $display("Writing in V%d", n4);
         for(I = 0; I < 250; I = I + 1)
           begin
	
          $fwrite(v_write_pointer, "%x",u1.u3.a6.Register[I]);
          $fwrite(v_write_pointer, "%x",u1.u3.a7.Register[I]);
          $fwrite(v_write_pointer, "%x",u1.u3.a8.Register[I]);
          $fwrite(v_write_pointer, "%x",u1.u3.a9.Register[I]);
          $fwrite(v_write_pointer, "\n");
           end
      	end
     end 



	always #5 clock = ~clock;

top u1 (.clock(clock), .NewElement(NewElement), .X(X), .Y(Y), .reset(reset), .EOC_Flag(EOC_Flag), .EnableChange(EnableChange));


endmodule
