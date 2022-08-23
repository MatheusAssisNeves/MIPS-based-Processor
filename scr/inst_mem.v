module inst_mem(clk, addr, read);

	input clk;
	input [31:0] addr;
	output [31:0] read;
	
	integer Spulse = 0;
	
	reg [31:0] mem[100:0]; // 100 de tamanho 32
	
	
	always @ (posedge clk )
	begin
	
		if (Spulse==0)
		begin
			//$readmemb("./instructions.txt", mem);
			
			mem[0] <= 32'b00000000000000000000000000000000; //NOP
			mem[1] <= 32'b010011_00000_00000_0000000001111011; //LOADi RD[0]=imm16(123)
			mem[2] <= 32'b010011_00001_00000_0000000101011001; //LOADi RD[1]=imm16(345)
			mem[3] <= 32'b010011_00010_00000_1111110111001001; //LOADi RD[2]=imm16(-567)
			mem[4] <= 32'b010011_00011_00000_0000001100010101; //LOADi RD[3]=imm16(789)
			mem[5] <= 32'b000001_00011_00000_00001_00000000000; //ADD rd[3]=rs[0] + rt[1] // 123[0] + 345[1] = 468[3]
			mem[6] <= 32'b000001_00001_00011_00010_00000000000; //ADD rd[1]=rs[3] + rt[2] // 468[3] + -567[2] = -99[1]
			mem[7] <= 32'b000011_00100_00001_00010_00000000000; //SUB rd[4]=rs[1] - rt[2] // -99[1] - -567[2] = 468[4]
			
			Spulse = 1;
		end
	end
	
	assign read = mem[addr];
	
endmodule