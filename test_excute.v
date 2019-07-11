`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:17:17 12/08/2018
// Design Name:   excute
// Module Name:   E:/PIPE/test_excute.v
// Project Name:  PIPE
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: excute
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_excute;

	// Inputs
	reg clk;
	reg [31:0] ID_EX_IR;
	reg [31:0] ID_EX_NPC;
	reg [31:0] ID_EX_A;
	reg [31:0] ID_EX_B;
	reg [31:0] ID_EX_Imm;

	// Outputs
	wire [31:0] EX_MEM_IR;
	wire [31:0] EX_MEM_ALU_output;
	wire [31:0] EX_MEM_B;
	wire EX_MEM_Cond;

	// Instantiate the Unit Under Test (UUT)
	excute uut (
		.clk(clk), 
		.ID_EX_IR(ID_EX_IR), 
		.ID_EX_NPC(ID_EX_NPC), 
		.ID_EX_A(ID_EX_A), 
		.ID_EX_B(ID_EX_B), 
		.ID_EX_Imm(ID_EX_Imm), 
		.EX_MEM_IR(EX_MEM_IR), 
		.EX_MEM_ALU_output(EX_MEM_ALU_output), 
		.EX_MEM_B(EX_MEM_B), 
		.EX_MEM_Cond(EX_MEM_Cond)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ID_EX_IR = 0;
		ID_EX_NPC = 0;
		ID_EX_A = 127;
		ID_EX_B = 5;
		ID_EX_Imm = 511;
	end
	
	always begin
		#10 ID_EX_NPC = ID_EX_NPC + 1;
	end
	
	always begin
		#5 clk = ~clk;
	end
	
	always begin
		#10 ID_EX_IR = 32'b00000100001000100001100000000000;
		#10 ID_EX_IR = 32'b00001000001000100001100000000000;
		#10 ID_EX_IR = 32'b00001100001000100001100000000000;
		#10 ID_EX_IR = 32'b00010000001000100001100000000000;
		#10 ID_EX_IR = 32'b00010100001000100001100000000000;
		#10 ID_EX_IR = 32'b00011000001000100001100000000000;
		#10 ID_EX_IR = 32'b00100000100001010000000000000100;
		#10 ID_EX_IR = 32'b00100100100001010000000000001000;
		#10 ID_EX_IR = 32'b00101000100001010000000000000000;
		#10 ID_EX_IR = 32'b00101100000000000000000000000000;
	end
      
endmodule

