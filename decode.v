`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:32:33 11/13/2018 
// Design Name: 
// Module Name:    decode 
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
module decode(
    input [31:0] IR_D,
	 input [31:0] IR_W,
	 input [31:0] NPC_D,
	 input [31:0] Data,
	 input clk,
	 output [31:0] A_D,
	 output [31:0] B_D,
	 output [31:0] Imm_D
    );

wire [5:0] op;
wire [4:0] Ri;
wire [4:0] Rj;
wire [4:0] Rk;

assign op = IR_D[31:26];
assign Ri = IR_D[25:21];
assign Rj = IR_D[20:16];
assign Rk = IR_D[15:11];

wire [5:0] wb_op;
wire [4:0] wb_Ri;

assign wb_op = IR_W[31:26];
assign wb_Ri = IR_W[25:21];

reg [31:0] register[0:31];
initial begin
	$readmemh("E:/register1.txt", register);
end

assign A_D = op == 6'b000000 ? 0 :
			op == 6'b001011 ? 0 :	// JMP
			op == 6'b001010 ? register[Ri]^register[Rj] :	// BEQ
			register[Rj];
assign B_D = op == 6'b000000 ? 0 :
			op[5:3] == 3'b000 ? register[Rk] : 
			register[Ri];
assign Imm_D = op[5:3] == 3'b000 ? 32'd0 :	// OP
			op == 6'b001011 ? {{6{IR_D[25]}}, IR_D[25:0]} :	// JUMP
			{{16{IR_D[15]}}, IR_D[15:0]};

always @ (negedge clk)
begin
	if(wb_op[5:3] == 3'b000 && wb_op != 6'b000000)
		register[wb_Ri] = Data;
   else if(wb_op == 6'b001001)
		register[wb_Ri] = Data;
end

endmodule
