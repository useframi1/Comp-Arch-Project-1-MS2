`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 05:59:45 PM
// Design Name: 
// Module Name: NMUX
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


module NMUX #(parameter n=32)(
input [n-1:0] A,
input [n-1:0] B,
input sel,
output [n-1:0] OUTPUT 
    );
    genvar i;
    
    generate  
    for (i=0;i<n;i=i+1) begin 
        MUX2X1 mux(.A(A[i]), .B(B[i]), .sel(sel), .OUT(OUTPUT[i]));
    end
    endgenerate
endmodule
