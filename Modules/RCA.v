`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2023 05:06:46 PM
// Design Name: 
// Module Name: RCA
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


module RCA # (parameter n = 8)(
    input [n-1:0] A, [n-1:0] B,
    input cin,
    output [n-1:0] sum
    );
    wire [n:0] cout;
    assign cout[0] = cin;
    genvar i;
   
    generate
        for (i = 0; i < n;i = i + 1) begin
          Full_Adder fa(.A(A[i]), .B(B[i]), .cin(cout[i]), .sum(sum[i]), .cout(cout[i+1]));
        end
    endgenerate
endmodule
