module ULA(sel, A, B, branch, out);

	output reg branch;
	input [3:0] sel;
	input signed [31:0] A, B;
	output reg [31:0] out;
	
	
	always @(sel or A or B)
	begin
		
		branch = 0;
		case (sel)
			4'b0000: out =  32'b0;
			4'b0001: out = A + B;
			4'b0010: out = A - B;
			4'b0011: out = ~A   ;
			4'b0100: out = A & B;
			4'b0101: out = A | B;
			4'b0110: out = A << B;
			4'b0111: out = A >> B;
			4'b1000: out = B + 0; //Loadi
			4'b1001: out = (A < B) ? 32'b1 : 32'b0;//SLT
			4'b1010:	branch = (A == B) ? 1 : 0;//BEQ
			4'b1011:	branch = (A != B) ? 1 : 0;//BNE
			default : out =  32'b0;
		endcase
	end
endmodule