`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AUC
// Engineer: Mariam ElGhobary & Youssef Elhagg
// 
// Create Date: 11/03/2023 05:04:12 PM
// Design Name: 
// Module Name: Nbit_register
// Project Name: Single Cycle rv32i Processor
// Target Devices: 
// Tool Versions: 
// Description: an N-bit register made of N D flip-flops
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Nbit_register #(parameter n=32) (
    input [n-1:0] D,
    input clk,
    input rst,
    input load,
    output [n-1:0]Q
);
    wire X[n-1:0];
    genvar i;
    generate 
        for(i=0;i<n;i=i+1) begin
            assign X[i]=(load==1)? D[i] : Q[i];
            DFF FF (.clk(clk), .rst(rst), .D(X[i]),  .Q(Q[i]));
        end
    endgenerate 
endmodule
