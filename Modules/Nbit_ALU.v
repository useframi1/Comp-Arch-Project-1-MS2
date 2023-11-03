`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2023 04:47:56 PM
// Design Name: 
// Module Name: Nbit_ALU
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


module Nbit_ALU #(parameter n = 32) (
input [n-1:0] A,B,
input [3:0] sel,
output reg [n-1:0] ALU_out,
output reg zero_flag
    );
    wire [n-1:0] adder_out;
    RCA #(.n(n)) rca(A,sel[2]?~B:B,sel[2],adder_out);
    always @(*) begin
        if(sel == 2 || sel == 6) ALU_out = adder_out;
        else if(sel == 0) ALU_out = A & B;
        else if(sel == 1) ALU_out = A | B;
        else ALU_out = 0;
        zero_flag = ALU_out == 0;
    end
    
endmodule
