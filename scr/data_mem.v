module data_mem(clk, MemWrite, addr, write, read);

	input clk, MemWrite;
	input [20:0] addr;
	input [31:0] write;
	output [31:0] read;
	integer Spulse = 0;
	
	reg [31:0] mem[100:0]; // 100 de tamanho 32
	
	
	always @(posedge clk) 
	begin
		if (Spulse==0)
		begin
			mem[0] <= 32'd0;
		
		Spulse = 1;
		end
		
		if(MemWrite)
		begin
			mem[addr] <= write;
		end
	end
	
	assign read = mem[addr];
	
endmodule