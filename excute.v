`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:32:45 11/13/2018 
// Design Name: 
// Module Name:    excute 
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
module excute(
	 input [31:0] IR_E,
	 input [31:0] NPC_E,
	 input [31:0] A_E,
	 input [31:0] B_E,
	 input [31:0] Imm_E,
    output [31:0] ALU_output_E,
    output Cond_E
    );

wire [5:0] op;
assign op = IR_E[31:26];

assign Cond_E = op == 6'b001011 ? 1:	// JUMP
					 op == 6'b001010 ? A_E == 0 :	// BEQ
					 0;
assign ALU_output_E = op == 6'b000001 ? A_E + B_E :
							 op == 6'b000010 ? A_E - B_E :
							 op == 6'b000011 ? A_E & B_E :
							 op == 6'b000100 ? A_E | B_E :
							 op == 6'b000101 ? A_E ^ B_E :
							 op == 6'b000110 ? A_E < B_E :
							 op == 6'b001000 ? A_E + Imm_E :
							 op == 6'b001001 ? A_E + Imm_E :
							 op == 6'b001010 ? ({16{Imm_E[15]}} << 2) + NPC_E :
							 op == 6'b001011 ? {NPC_E[31:26], Imm_E[25:0] << 2} :
							 0;
									
endmodule 