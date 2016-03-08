module decoder (clock, reset, data, Diagonal, Element, ElementAddr,EOF,sig, CompStart);
input         clock;
input         reset;
input [255:0] data;
input EOF;
input sig;
input         CompStart;

output [47:0] Diagonal;
output [48:0] Element;
output [10:0] ElementAddr;

reg    [47:0] Diagonal;
reg    [48:0] Element;
reg    [10:0] ElementAddr;

reg    [3:0]  NZE;
reg    [1:0]  Pos;
reg           NewElement;
reg sig_reg;
reg flag;
reg Comp_Flag;
reg buf1;

always@(posedge clock)
begin
    if (reset)
    begin
        NZE <= 4'b0000;
        Pos <= 2'b00;
	//flag <= 1'b0;
    end

    else if (NZE > 4'b0000)
    begin
	//if (NewElement == 1'b0)
	//	Element[48] <= 1'b0;
	//else
	//begin
	//	Element[48] <= 1'b1;
	//	NewElement <= 1'b0;
	
        if (Pos == 2'b00)
        begin
            Element[47:0] <= data[239:192];
	    Element[48] <= 1'b0;
            Pos <= Pos + 1'b1;
            NZE <= NZE - 1'b1;
	    ElementAddr <= data[250:240];
        end
        if (Pos == 2'b01)
        begin
            Element[47:0] <= data[175:128];
	    Element[48] <= 1'b0;	    
            Pos <= Pos + 1'b1;
            NZE <= NZE - 1'b1;
	    ElementAddr <= data[186:176];
        end
        if (Pos == 2'b10)
        begin
            Element[47:0] <= data[111:64];
	    Element[48] <= 1'b0;
            Pos <= Pos + 1'b1;
            NZE <= NZE - 1'b1;
	    ElementAddr <= data[122:112];
        end
        if (Pos == 2'b11)
        begin
            Element[47:0] <= data[47:0];
	    Element[48] <= 1'b0;
            Pos <= Pos + 1'b1;
            NZE <= NZE - 1'b1;
	    ElementAddr <= data[58:48];
        end
    end
    else if (!NZE)
    begin
	Element[48] <= 1'b1;
        case (Pos)
        2'b00: begin
                Diagonal <= data[239:192];
                Element[47:0] <= data[175:128];
		ElementAddr <= data[188:176];
                NZE <= data[252:248] - 4'b0001;
                Pos <= Pos + 2'b10;
		//NewElement <= 1'b0;
               end

        2'b01: begin
                Diagonal <= data[175:128];
                Element[47:0] <= data[111:64];
		ElementAddr <= data[122:112];
                NZE <= data[188:184] - 4'b0001;
                Pos <= Pos + 2'b10;
		//NewElement <= 1'b0;
               end

        2'b10: begin
                Diagonal <= data[111:64];
                Element[47:0] <= data[47:0];
		ElementAddr <= data[58:48];
                NZE <= data[124:120] - 4'b0001;
                Pos <= Pos + 2'b10;
		//NewElement <= 1'b0;
               end
        2'b11: begin
                Diagonal <= data[47:0];
                Element[47:0] <= 48'b0;
                NZE <= data[60:56];
                Pos <= Pos + 2'b01;
		Element[48] <= 1'b1;
		//NewElement <= 1'b1;
               end
        endcase
    end
 
    else if (sig_reg || buf1)
    begin
	Element[48] <= 1'b1;
         Diagonal <= data[239:192];
         Element[47:0] <= data[175:128];
		ElementAddr <= data[188:176];
               NZE <= data[252:248] - 4'b0001;
                Pos <= 2'b10;
		NewElement <= 1'b0;
		flag <= 1'b1;
     end
          
end

always@(posedge clock)
begin
	sig_reg <= sig;
	buf1 <= CompStart;
	Comp_Flag <= buf1; 
	if (sig)
	begin
		//NZE <= 5'dx;
		//Pos <= 2'b00;
		//flag <= 1'b1;
	end
	/*else if(!sig)
	begin
		flag <= 1'b0;
	end*/
end

endmodule
