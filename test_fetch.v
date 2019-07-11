`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:40:40 12/07/2018
// Design Name:   fetch
// Module Name:   E:/PIPE/test_fetch.v
// Project Name:  PIPE
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_fetch;

	// Inputs
	reg clk;
	reg reset;
	reg EX_MEM_Cond;
	reg [31:0] EX_MEM_ALU_output;

	// Outputs
	wire [31:0] IF_ID_IR;
	wire [31:0] IF_ID_NPC;

	// Instantiate the Unit Under Test (UUT)
	fetch uut (
		.clk(clk), 
		.reset(reset), 
		.EX_MEM_Cond(EX_MEM_Cond), 
		.EX_MEM_ALU_output(EX_MEM_ALU_output), 
		.IF_ID_IR(IF_ID_IR), 
		.IF_ID_NPC(IF_ID_NPC)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		EX_MEM_Cond = 0;
		EX_MEM_ALU_output = 0;

		#10 reset = 0;
		
	end
	
	always begin
		#5 clk = ~clk;
	end
	
	always begin
		#50 EX_MEM_Cond = ~EX_MEM_Cond;
	end

endmodule

