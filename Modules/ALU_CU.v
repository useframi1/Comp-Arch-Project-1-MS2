`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AUC
// Engineer: Mariam ElGhobary & Youssef Elhagg
// 
// Create Date: 11/03/2023 06:53:28 PM
// Design Name: 
// Module Name: ALU_CU
// Project Name: Single Cycle rv32i Processor
// Target Devices: 
// Tool Versions: 
// Description: The ALU control unit
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "defines.v"

module ALU_CU(
    input [1:0] ALUop,
    input [2:0] func3,
    input func7,
    output reg [3:0] ALU_sel
);
    
    always @(*) begin
        case(ALUop) 
            2'b00: ALU_sel = `ALU_ADD; 
            2'b01: ALU_sel = `ALU_SUB;
            2'b10: begin //R-Type and I-Type
                case(func3)  
                    3'd0 : begin 
                                if(func7 == 0)  
                                    ALU_sel = `ALU_ADD; 
                                else ALU_sel = `ALU_SUB; 
                           end
                    3'd4: ALU_sel = `ALU_XOR;        
                    3'd6: ALU_sel = `ALU_OR;
                    3'd7: ALU_sel = `ALU_AND;
                    3'd1: ALU_sel = `ALU_SLL;
                    3'd5: begin 
                                if(func7 == 0) 
                                    ALU_sel = `ALU_SRL;
                                else ALU_sel = `ALU_SRA;
                          end
                    3'd2: ALU_sel = `ALU_SLT;
                    3'd3: ALU_sel = `ALU_SLTU;
                endcase
            end
            2'b11: ALU_sel = `ALU_PASS; //lui and nop
        endcase
    end
    
endmodule

