`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AUC
// Engineer: Mariam ElGhobary & Youssef Elhagg
// 
// Create Date: 11/03/2023 05:04:12 PM
// Design Name: 
// Module Name: RegFile
// Project Name: Single Cycle rv32i Processor
// Target Devices: 
// Tool Versions: 
// Description: The 32x32 register file of the processor
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RegFile #(parameter n = 32)(
    input [4:0] read1,
    input [4:0] read2,
    input [4:0] write,
    input [n-1:0] Write_Data,
    input regWrite,
    input clk,
    input rst,
    output [n-1:0] read_data1,
    output [n-1:0] read_data2
);
    reg [n-1:0] regfile [31:0];
    integer i;
    
    always @(posedge clk or posedge rst) begin
        if (rst==1'b1) begin
            for (i=0;i<n;i=i+1) begin
                 regfile[i] <=0;
            end
        end
        else if(regWrite == 1'b1 && write != 0 && !rst)
            regfile[write]<=Write_Data;
    end
    
    assign read_data1 = regfile[read1];
    assign read_data2 = regfile[read2];
    
endmodule
