`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:17:04 12/07/2018
// Design Name:   decode
// Module Name:   E:/PIPE/test_decode.v
// Project Name:  PIPE
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decode
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_decode;

	// Inputs
	reg [31:0] IF_ID_IR;
	reg [31:0] IF_ID_NPC;
	reg [31:0] valD;
	reg clk;

	// Outputs
	wire [31:0] ID_EX_IR;
	wire [31:0] ID_EX_NPC;
	wire [31:0] ID_EX_A;
	wire [31:0] ID_EX_B;
	wire [31:0] ID_EX_Imm;

	// Instantiate the Unit Under Test (UUT)
	decode uut (
		.IF_ID_IR(IF_ID_IR), 
		.IF_ID_NPC(IF_ID_NPC), 
		.valD(valD), 
		.clk(clk), 
		.ID_EX_IR(ID_EX_IR), 
		.ID_EX_NPC(ID_EX_NPC), 
		.ID_EX_A(ID_EX_A), 
		.ID_EX_B(ID_EX_B), 
		.ID_EX_Imm(ID_EX_Imm)
	);

	initial begin
		// Initialize Inputs
		IF_ID_IR = 0;
		IF_ID_NPC = 0;
		valD = 7;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#10 IF_ID_IR = 32'b00000100001000100001100000000000;
		#10 IF_ID_IR = 32'b00001000001000100001100000000000;
		#10 IF_ID_IR = 32'b00001100001000100001100000000000;
		#10 IF_ID_IR = 32'b00010000001000100001100000000000;
		#10 IF_ID_IR = 32'b00010100001000100001100000000000;
		#10 IF_ID_IR = 32'b00011000001000100001100000000000;
		#10 IF_ID_IR = 32'b00100000100001010000000000000100;
		#10 IF_ID_IR = 32'b00100100100001010000000000001000;
		#10 IF_ID_IR = 32'b00101000100001010000000000000000;
		#10 IF_ID_IR = 32'b00101100000000000000000000000000;

	end
	
	always begin
		#5 clk = ~clk;
	end
	
	always begin
		#5 valD = valD + 8;
	end
      
endmodule

