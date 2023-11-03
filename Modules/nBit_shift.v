`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 06:22:33 PM
// Design Name: 
// Module Name: nBit_shift
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


module nBit_shift#(parameter n = 32)(
input [n-1:0] A,
output [n-1:0] B
    );
    
    assign B = {A[n-2:0], 1'b0};
    
endmodule
