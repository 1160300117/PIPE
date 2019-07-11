`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:58:28 12/09/2018
// Design Name:   write_back
// Module Name:   E:/PIPE/test_write_back.v
// Project Name:  PIPE
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: write_back
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_write_back;

	// Inputs
	reg clk;
	reg [31:0] MEM_WB_LMD;
	reg [31:0] EX_MEM_IR;
	reg [31:0] EX_MEM_ALU_output;

	// Outputs
	wire [31:0] MEM_WB_D;

	// Instantiate the Unit Under Test (UUT)
	write_back uut (
		.clk(clk), 
		.MEM_WB_LMD(MEM_WB_LMD), 
		.EX_MEM_IR(EX_MEM_IR), 
		.EX_MEM_ALU_output(EX_MEM_ALU_output), 
		.MEM_WB_D(MEM_WB_D)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		MEM_WB_LMD = 0;
		EX_MEM_IR = 0;
		EX_MEM_ALU_output = 0;

		// Wait 100 ns for global reset to finish
		#100 MEM_WB_LMD = 123;
      #100 EX_MEM_ALU_output = 456;

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
      
endmodule

