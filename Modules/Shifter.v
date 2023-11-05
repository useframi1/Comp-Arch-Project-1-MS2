`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AUC
// Engineer: Mariam ElGhobary & Youssef Elhagg
// 
// Create Date: 11/03/2023 05:04:12 PM
// Design Name: 
// Module Name: Shifter
// Project Name: Single Cycle rv32i Processor
// Target Devices: 
// Tool Versions: 
// Description: shifter module that executes the shift operatiosn of the ALU
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Shifter(
    input wire signed  [31:0] a,
    input [4:0] shamt, 
    input [1:0] type, 
    output reg [31:0] r
);

    always@ (*) begin
       case (type)
        2'b00 : r =  a >> shamt; //right
        2'b01 : r = a << shamt;  //left
        2'b10 : r = a >>> shamt; //right arithmetic
       endcase
    end

endmodule
