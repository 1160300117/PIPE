`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:33:28 11/13/2018 
// Design Name: 
// Module Name:    write_back 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module write_back(
	 input [31:0] LMD_W,
    input [31:0] IR_W,
    input [31:0] ALU_output_W,
    output [31:0] Data
    );

assign Data = IR_W[31:29] == 3'b000 ? ALU_output_W : LMD_W;

endmodule
