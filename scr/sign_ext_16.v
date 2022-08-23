module sign_ext_16(in16, out32);

	input [15:0] in16;
	
	output reg [31:0] out32;
	
	always @(in16)
	begin
	
	out32 <= $signed(in16);
	
	end
endmodule
