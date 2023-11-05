`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2023 06:34:23 PM
// Design Name: 
// Module Name: Control_Unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "defines.v"

module Control_Unit(
    input [4:0] opcode, 
    output reg branch, 
    output reg memRead,
    output reg memWrite,
    output reg ALUsrc1,
    output reg ALUsrc2,
    output reg regWrite,
    output reg PC_enable,
    output reg jump,
    output reg [1:0] ALUop, memToReg
);
    
    always @(*) begin
        case (opcode)
        
            `OPCODE_Arith_R: begin  // R-format
                            branch = 0;
                            memRead = 0;
                            memToReg = 2'b01;
                            ALUop = 2'b10;
                            memWrite = 0;
                            ALUsrc1 = 0;
                            ALUsrc2 = 1;
                            regWrite = 1;
                            PC_enable = 1;
                            jump = 0;
            end
            `OPCODE_Arith_I: begin// I-format
                            branch = 0;
                            memRead = 0;
                            memToReg = 2'b01;
                            ALUop = 2'b10;
                            memWrite = 0;
                            ALUsrc1 = 0;
                            ALUsrc2 = 0;
                            regWrite = 1;
                            PC_enable = 1;
                            jump = 0;
            end
            `OPCODE_Load: begin // LW
                            branch = 0;
                            memRead = 1;
                            memToReg = 2'b00;
                            ALUop = 2'b00;
                            memWrite = 0;
                            ALUsrc1 = 0;
                            ALUsrc2 = 0;
                            regWrite = 1;
                            PC_enable = 1;
                            jump = 0;
            end
            `OPCODE_Store: begin// SW
                            branch = 0;
                            memRead = 0;
                            memToReg = 2'b11;
                            ALUop = 2'b00;
                            memWrite = 1;
                            ALUsrc1 = 0;
                            ALUsrc2 = 0;
                            regWrite = 0;
                            PC_enable = 1;
                            jump = 0;
            end
            `OPCODE_Branch: begin// BEQ
                            branch = 1;
                            memRead = 0;
                            memToReg = 2'b11;
                            ALUop = 2'b01;
                            memWrite = 0;
                            ALUsrc1 = 0;
                            ALUsrc2 = 1;
                            regWrite = 0;
                            PC_enable = 1;
                            jump = 0;
            end
            `OPCODE_JALR: begin// JALR
                            branch = 0;
                            memRead = 0;
                            memToReg = 2'b11;
                            ALUop = 2'b00;
                            memWrite = 0;
                            ALUsrc1 = 0;
                            ALUsrc2 = 0;
                            regWrite = 1;
                            PC_enable = 1;
                            jump = 1;
            end
            `OPCODE_JAL: begin// JAL
                            branch = 0;
                            memRead = 0;
                            memToReg = 2'b11;
                            ALUop = 2'b00;
                            memWrite = 0;
                            ALUsrc1 = 1;
                            ALUsrc2 = 0;
                            regWrite = 1;
                            PC_enable = 1;
                            jump = 1;
            end
            `OPCODE_AUIPC: begin// AUIPC
                            branch = 0;
                            memRead = 0;
                            memToReg = 2'b01;
                            ALUop = 2'b00;
                            memWrite = 0;
                            ALUsrc1 = 1;
                            ALUsrc2 = 0;
                            regWrite = 1;
                            PC_enable = 1;
                            jump = 0;
            end
            `OPCODE_LUI: begin// LUI
                            branch = 0;
                            memRead = 0;
                            memToReg = 2'b01;
                            ALUop = 2'b11;
                            memWrite = 0;
                            ALUsrc1 = 0;
                            ALUsrc2 = 0;
                            regWrite = 1;
                            PC_enable = 1;
                            jump = 0;
            end
            `OPCODE_SYSTEM: begin // system calls
                            branch = 0;
                            memRead = 0;
                            memToReg = 2'b11;
                            ALUop = 2'b00;
                            memWrite = 0;
                            ALUsrc1 = 0;
                            ALUsrc2 = 0;
                            regWrite = 0;
                            PC_enable = 0;
                            jump = 0;
            end
            default: begin// FENCE
                            branch = 0;
                            memRead = 0;
                            memToReg = 2'b11;
                            ALUop = 2'b00;
                            memWrite = 0;
                            ALUsrc1 = 0;
                            ALUsrc2 = 0;
                            regWrite = 0;
                            PC_enable = 1;
                            jump = 0;
            end
        endcase
    
    end
    
endmodule
