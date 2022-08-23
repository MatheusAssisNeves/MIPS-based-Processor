module sign_ext_26(in26, out32);

	input [25:0] in26;
	
	output reg [31:0] out32;
	
	always @(in26)
	begin
	
	out32 <= $signed(in26);
	
	end
endmodule
