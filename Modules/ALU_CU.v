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
input [2:0] inst_1,
input inst_2,
output reg [3:0] ALU_sel
    );
    
    always @(*) begin
    
        if(ALUop == 0) ALU_sel = 4'b0010;
        else if(ALUop == 2'b01) ALU_sel = 4'b0110;
        else if(ALUop == 2'b10) begin
            if (inst_1 == 0 && inst_2 == 0) ALU_sel = 4'b0010;
            else if (inst_1 == 0 && inst_2 == 1) ALU_sel = 4'b0110;
            else if (inst_1 == 3'b111 && inst_2 == 0) ALU_sel = 4'b0000;
            else if (inst_1 == 3'b110 && inst_2 == 0) ALU_sel = 4'b0001;
        end
    
    end
    
endmodule
