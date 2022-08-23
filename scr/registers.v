module registers(clk, RegWrite, addrR_reg1, addrR_reg2, addrR_reg3, addrW_reg, write_reg, read_reg1, read_reg2, read_reg3, SIMr0, SIMr1, SIMr2, SIMr3, SIMr4, SIMr5);

	input clk, RegWrite;
	input [4:0] addrR_reg1, addrR_reg2, addrR_reg3, addrW_reg;
	input [31:0] write_reg;
	output [31:0] read_reg1, read_reg2, read_reg3;
	integer Spulse = 0;
	
	output [31:0] SIMr0, SIMr1, SIMr2, SIMr3, SIMr4, SIMr5;
	
	reg [31:0] regs[31:0]; //32 registradores de tamanho 32
	
	
	always @ (posedge clk )
	begin
	
		if (Spulse==0)
		begin
			regs[0] <= 32'd0;

		
		Spulse = 1;
		end
	
		if(RegWrite) 
		begin
			regs[addrW_reg] <= write_reg;
		end
	end

	assign read_reg1 = regs[addrR_reg1];
	assign read_reg2 = regs[addrR_reg2];
	assign read_reg3 = regs[addrR_reg3];
	
	//para ver registradores na simulação
	assign SIMr0 = regs[0];
	assign SIMr1 = regs[1];
	assign SIMr2 = regs[2];
	assign SIMr3 = regs[3];
	assign SIMr4 = regs[4];
	assign SIMr5 = regs[5];

endmodule