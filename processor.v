`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:36:32 11/13/2018 
// Design Name: 
// Module Name:    processor 
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
module processor(
    input clk,
    input reset,
	 output Cond_F
    );
	
	wire [31:0] IR_F, ALU_output_F, NPC_F;
	wire [31:0] IR_D, NPC_D, Data, A_D, B_D, Imm_D;
	wire [31:0] IR_E, NPC_E, A_E, B_E, Imm_E, ALU_output_E;
	wire [31:0] IR_M, ALU_output_M, B_M, LMD_M;
	wire [31:0] LMD_W, IR_W, ALU_output_W;
	wire Cond_F, Cond_E;
	
	reg [31:0] IF_ID_IR;
	reg [31:0] IF_ID_NPC;
	
	reg [31:0] ID_EX_IR;
	reg [31:0] ID_EX_NPC;
	reg [31:0] ID_EX_A;
	reg [31:0] ID_EX_B;
	reg [31:0] ID_EX_Imm;
	
	reg [31:0] EX_MEM_IR;
	reg [31:0] EX_MEM_B;
	reg [31:0] EX_MEM_ALU_output;
	reg EX_MEM_Cond;
	
	reg [31:0] MEM_WB_IR;
	reg [31:0] MEM_WB_ALU_output;
	reg [31:0] MEM_WB_LMD;
	reg [31:0] MEM_WB_D;
	
	always @ (posedge clk)
	begin
		IF_ID_IR = IR_F;
		IF_ID_NPC = NPC_F;
	end
	
	assign IR_D = IF_ID_IR;
	assign NPC_D = IF_ID_NPC;
	
	always @ (posedge clk)
	begin
		ID_EX_IR = IR_D;
		ID_EX_NPC = NPC_D;
		ID_EX_A = A_D;
		ID_EX_B = B_D;
		ID_EX_Imm = Imm_D;
	end
	
	assign IR_E = ID_EX_IR;
	assign NPC_E = ID_EX_NPC;
	assign A_E = ID_EX_A;
	assign B_E = ID_EX_B;
	assign Imm_E = ID_EX_Imm;
	
	always @ (posedge clk)
	begin
		EX_MEM_IR = IR_E;
		EX_MEM_B = B_E;
		EX_MEM_ALU_output = ALU_output_E;
		EX_MEM_Cond = Cond_E;
	end
	
	assign IR_M = EX_MEM_IR;
	assign ALU_output_M = EX_MEM_ALU_output;
	assign B_M = EX_MEM_B;
	assign Cond_F = EX_MEM_Cond;
	assign ALU_output_F = EX_MEM_ALU_output;
	
	always @ (posedge clk)
	begin
		MEM_WB_IR = IR_M;
		MEM_WB_ALU_output = ALU_output_M;
		MEM_WB_LMD = LMD_M;
	end
	
	assign IR_W = MEM_WB_IR;
	assign ALU_output_W = MEM_WB_ALU_output;
	assign LMD_W = MEM_WB_LMD;
	
	fetch F(clk, reset, Cond_F, ALU_output_F, IR_F, NPC_F);
	decode D(IR_D, IR_W, NPC_D, Data, clk, A_D, B_D, Imm_D);
	excute E(IR_E, NPC_E, A_E, B_E, Imm_E, ALU_output_E, Cond_E);
	memory M(clk, IR_M, ALU_output_M, B_M, LMD_M);
	write_back W(LMD_W, IR_W, ALU_output_W, Data);

endmodule
