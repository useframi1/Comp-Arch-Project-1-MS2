`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AUC
// Engineer: Mariam ElGhobary & Youssef Elhagg
// 
// Create Date: 11/03/2023 05:04:12 PM
// Design Name: 
// Module Name: MUX2X1
// Project Name: Single Cycle rv32i Processor
// Target Devices: 
// Tool Versions: 
// Description: a 1-bit 2x1 MUX
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX2X1(
    input A,
    input B,
    input sel,
    output OUT
);
   assign OUT=(sel==1)?B:A;
endmodule
