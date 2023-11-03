`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2023 06:53:28 PM
// Design Name: 
// Module Name: ALU_CU
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


module ALU_CU(
input [1:0] ALUop,
input [2:0] inst_1, //func3
input inst_2, //func7
output reg [3:0] ALU_sel
    );
    
    always @(*) begin
    case(ALUop) 
        2'b00: ALU_sel = ALU_ADD; 
        2'b01: ALU_sel = ALU_SUB;
        2'b10: begin //R-Type and I-Type
            case(inst_1)  
                3'd0 : begin 
                            if(inst_2 == 0)  
                                ALU_sel = ALU_ADD; 
                            else ALU_sel = ALU_SUB; 
                       end
                3'd4: ALU_sel = ALU_XOR;        ;
                3'd6: ALU_sel = ALU_OR;
                3'd7: ALU_sel = ALU_AND;
                3'd1: ALU_sel = ALU_SLL;
                3'd5: begin 
                            if(inst_2 == 0) 
                                ALU_sel = ALU_SRL;
                            else ALU_sel = ALU_SRA;
                      end
                3'd2: ALU_sel = ALU_SLT;
                3'd3: ALU_sel = ALU_SLTU;
            endcase
        end
        2'b11: ALU_sel = ALU_PASS; //lui and nop
    endcase

    
    end
    
endmodule

