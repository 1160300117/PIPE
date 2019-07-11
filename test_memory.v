`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:33:54 12/09/2018
// Design Name:   memory
// Module Name:   E:/PIPE/test_memory.v
// Project Name:  PIPE
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_memory;

	// Inputs
	reg clk;
	reg [31:0] EX_MEM_IR;
	reg [31:0] EX_MEM_ALU_output;
	reg [31:0] EX_MEM_B;

	// Outputs
	wire [31:0] MEM_WB_LMD;

	// Instantiate the Unit Under Test (UUT)
	memory uut (
		.clk(clk), 
		.EX_MEM_IR(EX_MEM_IR), 
		.EX_MEM_ALU_output(EX_MEM_ALU_output), 
		.EX_MEM_B(EX_MEM_B), 
		.MEM_WB_LMD(MEM_WB_LMD)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		EX_MEM_IR = 0;
		EX_MEM_ALU_output = 0;
		EX_MEM_B = 127;
	end
	
	always begin
		#5 clk = ~clk;
	end
	
	always begin
		#10 EX_MEM_IR = 32'b00000100001000100001100000000000;
		#10 EX_MEM_IR = 32'b00001000001000100001100000000000;
		#10 EX_MEM_IR = 32'b00001100001000100001100000000000;
		#10 EX_MEM_IR = 32'b00010000001000100001100000000000;
		#10 EX_MEM_IR = 32'b00010100001000100001100000000000;
		#10 EX_MEM_IR = 32'b00011000001000100001100000000000;
		#10 EX_MEM_IR = 32'b00100000100001010000000000000100;
		#10 EX_MEM_IR = 32'b00100100100001010000000000001000;
		#10 EX_MEM_IR = 32'b00101000100001010000000000000000;
		#10 EX_MEM_IR = 32'b00101100000000000000000000000000;
	end
	
	always begin
		#50 EX_MEM_ALU_output = EX_MEM_ALU_output + 1;
	end
	
endmodule

