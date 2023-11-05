`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AUC
// Engineer: Mariam ElGhobary & Youssef Elhagg
// 
// Create Date: 09/19/2023 05:10:50 PM
// Design Name: 
// Module Name: DFF
// Project Name: Single Cycle rv32i Processor
// Target Devices: 
// Tool Versions: 
// Description: D flip-flop
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DFF (
    input clk, 
    input rst, 
    input D, 
    output reg Q
);
    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            Q <= 1'b0;
        end 
        else begin
            Q <= D;
        end
    end
endmodule
