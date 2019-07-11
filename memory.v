`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:33:15 11/13/2018 
// Design Name: 
// Module Name:    memory 
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
module memory(
	 input clk,
	 input [31:0] IR_M,
	 input [31:0] ALU_output_M,
    input [31:0] B_M,
    output [31:0] LMD_M
    );
	 
assign LMD_M = IR_M[31:26] == 6'b001001 ? DATA_mem[ALU_output_M] : 0;

reg [31:0] DATA_mem[0:255];
initial begin
	$readmemh("E:/data1.txt", DATA_mem);
end

always @ (posedge clk)
begin
	if(IR_M[31:26] == 6'b001000)
	begin
		DATA_mem[ALU_output_M] = B_M;
	end
end
endmodule
