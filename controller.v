module controller (clock, EnableChange, DiagonalDoneX, DiagonalDoneY, NewRowFetchX, NewRowFetchY, ComputationReady, FoundX, FoundY, EnableColX, EnableColY);

input clock;
input EnableChange;
//input ChangeOccured;
input FoundX;
input FoundY;
input DiagonalDoneX;
input DiagonalDoneY;

output NewRowFetchX;
output NewRowFetchY;
output ComputationReady;
output EnableColX;
output EnableColY;

//reg NewRowFetchX;
reg NewRowCheck;
reg ComputationReady;
reg NewRowFetchX;
reg NewRowFetchY;
reg EnableColX;
reg EnableColY;

always@(posedge clock)
begin
	if (EnableChange == 1'b1)
	begin
		EnableColX <= 1'b0;
		EnableColY <= 1'b0;
		NewRowFetchX <= 1'b0;
		NewRowFetchY <= 1'b0;
		ComputationReady <= 1'b0;
	end
	//if (ChangeOccured == 1'b1)
	//	NewRowFetch <= 1'b1;
	
	if (DiagonalDoneX == 1'b1 && NewRowFetchX == 1'b0)
	begin
		EnableColX <= 1'b1;
	end	
	
	if (FoundX == 1'b0)
	begin
		NewRowFetchX <= 1'b1;
	end
	
	else if (FoundX == 1'b1 )
	begin
		EnableColX <= 1'b0;
		NewRowFetchX <= 1'b0;
	end
/************************************************************************/	
	if (DiagonalDoneY == 1'b1 && NewRowFetchY == 1'b0)
	begin
		EnableColY <= 1'b1;
	end	
	
	if (FoundY == 1'b0)
	begin
		NewRowFetchY <= 1'b1;
	end
	
	else if (FoundY == 1'b1 )
	begin
		EnableColY <= 1'b0;
		NewRowFetchY <= 1'b0;
	end
	


end

endmodule
