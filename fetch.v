	`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:32:22 11/13/2018 
// Design Name: 
// Module Name:    fetch 
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
module fetch(
    input clk,
	 input reset,
	 input Cond_F,
	 input [31:0] ALU_output_F,
    output reg [31:0] IR_F,
	 output reg [31:0] NPC_F
    );

reg [31:0] IR_mem[0:255];
initial begin
	$readmemh("E:/ir1.txt", IR_mem, 0, 24);
end

reg [15:0] stop1, stop2;
wire [31:0] IR1, IR2, IR3;
assign IR1 = IR_mem[PC];
assign IR2 = IR_mem[PC + 1];
assign IR3 = IR_mem[PC + 2];

reg [31:0] PC;
always @ (posedge clk)
begin  
	if(reset) begin
		PC = 0;
		stop1 = 0;
		stop2 = 1;
	end
	else begin	
		stop1 = stop1 < 1 ? stop1 + 1 :
				 (IR1[31:26] == 6'b001001 && IR3[31:29] == 3'b000 && (IR1[25:21] == IR3[20:16] || IR1[25:21] == IR3[15:11])) || // Load -> RR-Alu 
             (IR1[31:26] == 6'b001001 && IR3[31:26] == 6'b001001 && IR1[25:21] == IR3[20:16]) || // Load -> Load
             (IR1[31:26] == 6'b001001 && IR3[31:26] == 6'b001000 && IR1[25:21] == IR3[25:21]) || // Load -> Store
				 (IR1[31:29] == 3'b000 && IR3[31:29] == 3'b000 && (IR1[25:21] == IR3[20:16] || IR1[25:21] == IR3[15:11]))? 0 : // RR-ALU -> RR-Alu 
				 stop1 + 1;
		stop2 = stop2 < 2 ? stop2 + 1 :
				 (IR1[31:26] == 6'b001001 && IR2[31:29] == 3'b000 && (IR1[25:21] == IR2[20:16] || IR1[25:21] == IR2[15:11])) || // Load -> RR-Alu 
             (IR1[31:26] == 6'b001001 && IR2[31:26] == 6'b001001 && IR1[25:21] == IR2[20:16]) || // Load -> Load
             (IR1[31:26] == 6'b001001 && IR2[31:26] == 6'b001000 && IR1[25:21] == IR2[25:21]) || // Load -> Store
				 (IR1[31:29] == 3'b000 && IR2[31:29] == 3'b000 && (IR1[25:21] == IR2[20:16] || IR1[25:21] == IR2[15:11]))? 0 : // RR-ALU -> RR-Alu 
				 stop1 == 1 ? 1 :
				 stop2 + 1;
		PC = stop2 < 2 ? PC :
			  Cond_F == 0 ? PC + 1 : 
			  ALU_output_F;
	end
	IR_F = stop2 < 2 ? IR_mem[0] : IR_mem[PC];
	NPC_F = PC + 1;
end

endmodule
