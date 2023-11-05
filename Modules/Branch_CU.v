`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AUC
// Engineer: Mariam ElGhobary & Youssef Elhagg
// 
// Create Date: 11/03/2023 06:56:23 PM
// Design Name: 
// Module Name: Branch_CU
// Project Name: Single Cycle rv32i Processor
// Target Devices: 
// Tool Versions: 
// Description: The branch control unit
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "defines.v"

module Branch_CU (
    input branch,
    input Z,
    input C,
    input S,
    input V,
    input [2:0] func3,
    output reg branch_out 
);
    always @(*) begin
        if (branch) begin
            case (func3)
                `BR_BEQ     :       branch_out = Z;
                `BR_BNE     :       branch_out = ~Z;
                `BR_BLT     :       branch_out = S!=V;
                `BR_BGE     :       branch_out = S == V;
                `BR_BLTU    :       branch_out = ~C;
                `BR_BGEU    :       branch_out = C; 
                default     :       branch_out = 1'b0;
            endcase
        end
        else branch_out = 1'b0;
    end

endmodule