// Copyright (C) 2017  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"
// CREATED		"Tue Aug 23 16:43:39 2022"

module arquitetura(
	clk,
	sim_branch,
	memAddr,
	memData,
	memdataOut,
	reg0,
	reg1,
	reg2,
	reg3,
	reg4,
	reg5,
	SIMinstrucao,
	SIMpc,
	ulaA,
	ulaB
);


input wire	clk;
output wire	sim_branch;
output wire	[20:0] memAddr;
output wire	[31:0] memData;
output wire	[31:0] memdataOut;
output wire	[31:0] reg0;
output wire	[31:0] reg1;
output wire	[31:0] reg2;
output wire	[31:0] reg3;
output wire	[31:0] reg4;
output wire	[31:0] reg5;
output wire	[31:0] SIMinstrucao;
output wire	[31:0] SIMpc;
output wire	[31:0] ulaA;
output wire	[31:0] ulaB;

wire	[31:0] dataOut;
wire	[31:0] instruct;
wire	jump;
wire	memwrite;
wire	[31:0] readReg2;
wire	[31:0] readRegW;
wire	regwrite;
wire	sel1;
wire	sel2;
wire	sel3;
wire	sel4;
wire	[3:0] selULA;
wire	ULAbranch;
wire	[31:0] ulaOut;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	[31:0] SYNTHESIZED_WIRE_7;

assign	SIMpc = SYNTHESIZED_WIRE_5;
assign	ulaA = SYNTHESIZED_WIRE_0;
assign	ulaB = SYNTHESIZED_WIRE_1;




ULA	b2v_inst(
	.A(SYNTHESIZED_WIRE_0),
	.B(SYNTHESIZED_WIRE_1),
	.sel(selULA),
	.branch(ULAbranch),
	.out(ulaOut));


sign_ext_16	b2v_inst12(
	.in16(instruct[15:0]),
	.out32(SYNTHESIZED_WIRE_4));


sign_ext_26	b2v_inst13(
	.in26(instruct[25:0]),
	.out32(SYNTHESIZED_WIRE_7));


registers	b2v_inst153(
	.clk(clk),
	.RegWrite(regwrite),
	.addrR_reg1(instruct[20:16]),
	.addrR_reg2(instruct[15:11]),
	.addrR_reg3(instruct[25:21]),
	.addrW_reg(instruct[25:21]),
	.write_reg(SYNTHESIZED_WIRE_2),
	.read_reg1(SYNTHESIZED_WIRE_0),
	.read_reg2(readReg2),
	.read_reg3(readRegW),
	.SIMr0(reg0),
	.SIMr1(reg1),
	.SIMr2(reg2),
	.SIMr3(reg3),
	.SIMr4(reg4),
	.SIMr5(reg5));


UC	b2v_inst16(
	.opcode(instruct[31:26]),
	.sel1(sel1),
	.sel2(sel2),
	.sel3(sel3),
	.sel4(sel4),
	.jump(jump),
	.regwrite(regwrite),
	.memwrite(memwrite),
	.selULA(selULA));


busmux_0	b2v_inst2(
	.sel(sel4),
	.dataa(SYNTHESIZED_WIRE_3),
	.datab(SYNTHESIZED_WIRE_4),
	.result(SYNTHESIZED_WIRE_1));


busmux_1	b2v_inst462(
	.sel(sel2),
	.dataa(dataOut),
	.datab(ulaOut),
	.result(SYNTHESIZED_WIRE_2));


inst_mem	b2v_inst5(
	.clk(clk),
	.addr(SYNTHESIZED_WIRE_5),
	.read(instruct));


PC	b2v_inst6(
	.clk(clk),
	.jump(jump),
	.branch(ULAbranch),
	.bOff(instruct[15:0]),
	.jVal(SYNTHESIZED_WIRE_6),
	.addr(SYNTHESIZED_WIRE_5));


data_mem	b2v_inst7(
	.clk(clk),
	.MemWrite(memwrite),
	.addr(instruct[20:0]),
	.write(readRegW),
	.read(dataOut));


busmux_2	b2v_inst8(
	.sel(sel1),
	.dataa(readRegW),
	.datab(SYNTHESIZED_WIRE_7),
	.result(SYNTHESIZED_WIRE_6));


busmux_3	b2v_inst9(
	.sel(sel3),
	.dataa(readReg2),
	.datab(readRegW),
	.result(SYNTHESIZED_WIRE_3));

assign	sim_branch = ULAbranch;
assign	memAddr[20:0] = instruct[20:0];
assign	memData = readRegW;
assign	memdataOut = dataOut;
assign	SIMinstrucao = instruct;

endmodule

module busmux_0(sel,dataa,datab,result);
/* synthesis black_box */

input sel;
input [31:0] dataa;
input [31:0] datab;
output [31:0] result;

endmodule

module busmux_1(sel,dataa,datab,result);
/* synthesis black_box */

input sel;
input [31:0] dataa;
input [31:0] datab;
output [31:0] result;

endmodule

module busmux_2(sel,dataa,datab,result);
/* synthesis black_box */

input sel;
input [31:0] dataa;
input [31:0] datab;
output [31:0] result;

endmodule

module busmux_3(sel,dataa,datab,result);
/* synthesis black_box */

input sel;
input [31:0] dataa;
input [31:0] datab;
output [31:0] result;

endmodule
