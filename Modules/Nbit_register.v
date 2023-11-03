`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 05:11:56 PM
// Design Name: 
// Module Name: Nbit_register
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


module Nbit_register #(parameter n=32)(
input [n-1:0] D,
input clk,rst,load,
output [n-1:0]Q
    );
    wire X[n-1:0];
    genvar i;
    generate for(i=0;i<n;i=i+1) begin
    assign X[i]=(load==1)? D[i] : Q[i];
    DFF FF (.clk(clk), .rst(rst), .D(X[i]),  .Q(Q[i]));
    end
    endgenerate 
endmodule
