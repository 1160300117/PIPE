`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:03:27 12/07/2018
// Design Name:   processor
// Module Name:   E:/PIPE/test_processor.v
// Project Name:  PIPE
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_processor;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire Cond_F;

	// Instantiate the Unit Under Test (UUT)
	processor uut (
		.clk(clk), 
		.reset(reset), 
		.Cond_F(Cond_F)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		reset = 1;
		#70 reset = 0;

	end
	
	always begin
		#10 clk = ~clk;
	end
      
endmodule

