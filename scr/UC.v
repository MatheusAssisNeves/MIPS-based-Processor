module UC(opcode, sel1, sel2, sel3, sel4, selULA, jump, regwrite, memwrite);  

	input [5:0] opcode;
	output reg sel1, sel2, sel3, sel4, jump, regwrite, memwrite;
	output reg [3:0] selULA;




always @(opcode)  
begin

		case(opcode)
		
			6'b000000: // N0-OP 
			begin
				sel1 =     1'b0;
				sel2 =     1'b0;
				sel3 =     1'b0;
				sel4 =     1'b0;
				selULA =   4'b0000;
				regwrite = 1'b0;
				memwrite = 1'b0;
				jump =     1'b0;	
			end

			6'b000001: // ADD 
			begin
				sel1 =     1'b0;
				sel2 =     1'b1;
				sel3 =     1'b0;
				sel4 =     1'b0;
				selULA =   4'b0001;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	
			end
			
			6'b000010: // ADDi
			begin
				sel1 =     1'b0;
				sel2 =     1'b1;
				sel3 =     1'bX;
				sel4 =     1'b1;
				selULA =   4'b0001;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	
			end
			
			6'b000011: // SUB 
			begin
				sel1 =     1'b0;
				sel2 =     1'b1;
				sel3 =     1'b0;
				sel4 =     1'b0;
				selULA =   4'b0010;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	
			end
			
			6'b000100: // SUBi
			begin
				sel1 =     1'b0;
				sel2 =     1'b1;
				sel3 =     1'bX;
				sel4 =     1'b1;
				selULA =   4'b0010;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	
			end
			
			6'b000101: // Not
			begin
				sel1 =     1'b0;
				sel2 =     1'b1;
				sel3 =     1'b0;
				sel4 =     1'b0;
				selULA =   4'b0011;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	
			end
			
			6'b000110: // AND
			begin
				sel1 =     1'b0;
				sel2 =     1'b1;
				sel3 =     1'b0;
				sel4 =     1'b0;
				selULA =   4'b0100;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	
			end
			
			6'b000100: // ANDi
			begin
				sel1 =     1'b0;
				sel2 =     1'b1;
				sel3 =     1'bX;
				sel4 =     1'b1;
				selULA =   4'b0100;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	
			end	

			6'b001000: // OR
			begin
				sel1 =     1'b0;
				sel2 =     1'b1;
				sel3 =     1'b0;
				sel4 =     1'b0;
				selULA =   4'b0101;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	
			end
			
			6'b001001: // ORi
			begin
				sel1 =     1'b0;
				sel2 =     1'b1;
				sel3 =     1'bX;
				sel4 =     1'b1;
				selULA =   4'b0101;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	
			end	

			6'b001010: // ShiftLeft
			begin
				sel1 =     1'b0;
				sel2 =     1'b1;
				sel3 =     1'bX;
				sel4 =     1'b1;
				selULA =   4'b0110;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	
			end

			6'b001011: // ShiftRight
			begin
				sel1 =     1'b0;
				sel2 =     1'b1;
				sel3 =     1'bX;
				sel4 =     1'b1;
				selULA =   4'b0111;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	
			end
			
			6'b001100: // SLT
			begin
				sel1 =     1'b0;
				sel2 =     1'b1;
				sel3 =     1'b0;
				sel4 =     1'b0;
				selULA =   4'b1001;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	
			end
			
			6'b001101: // SLTi
			begin
				sel1 =     1'b0;
				sel2 =     1'b1;
				sel3 =     1'bX;
				sel4 =     1'b1;
				selULA =   4'b1001;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	
			end	
				
			6'b001110: // BEQ	
			begin 
				sel1 =     1'b0;
				sel2 =     1'b0;
				sel3 =     1'b1;
				sel4 =     1'b0;
				selULA =   4'b1010;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	 
			end
			
			6'b001111: // BNQ	
			begin 
				sel1 =     1'b0;
				sel2 =     1'b0;
				sel3 =     1'b1;
				sel4 =     1'b0;
				selULA =   4'b1011;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	 
			end
			
			6'b010000: // J	
			begin 
				sel1 =     1'b0;
				sel2 =     1'b0;
				sel3 =     1'b0;
				sel4 =     1'b0;
				selULA =   4'b0000;
				regwrite = 1'b0;
				memwrite = 1'b0;
				jump =     1'b1;	 
			end 
			
			6'b010001: // Ji
			begin 
				sel1 =     1'b1;
				sel2 =     1'b0;
				sel3 =     1'b0;
				sel4 =     1'b0;
				selULA =   4'b0000;
				regwrite = 1'b0;
				memwrite = 1'b0;
				jump =     1'b1;	 
			end 
			
			6'b010010: // Load
			begin 
				sel1 =     1'b0;
				sel2 =     1'b0;
				sel3 =     1'b0;
				sel4 =     1'b0;
				selULA =   4'b0000;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	 
			end 
			
			6'b010011: // Loadi
			begin 
				sel1 =     1'b0;
				sel2 =     1'b1;
				sel3 =     1'b0;
				sel4 =     1'b1;
				selULA =   4'b1000;
				regwrite = 1'b1;
				memwrite = 1'b0;
				jump =     1'b0;	 
			end 
			
			6'b010100: // STORE
			begin 
				sel1 =     1'b0;
				sel2 =     1'b0;
				sel3 =     1'b0;
				sel4 =     1'b0;
				selULA =   4'b0000;
				regwrite = 1'b0;
				memwrite = 1'b1;
				jump =     1'b0;	 
			end 
			
			default:
			begin 
				sel1 =     1'b0;
				sel2 =     1'b0;
				sel3 =     1'b0;
				sel4 =     1'b0;
				selULA =   4'b0000;
				regwrite = 1'b0;
				memwrite = 1'b0;
				jump =     1'b0;	 
			end  
		endcase   
 end  
 endmodule  