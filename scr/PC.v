module PC(clk, jump, branch, jVal, bOff, addr);

	input clk;
	input jump, branch;
	
	input [15:0] bOff;
	input [31:0] jVal;
	
	output reg [31:0] addr;
	
	always @ (posedge clk )
	begin
		
		if (jump)
			addr <= jVal;
		else if (branch)
			addr <= addr + $signed(bOff);
		else
			addr <= addr + 1;
			
	end
endmodule