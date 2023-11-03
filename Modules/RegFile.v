`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2023 05:50:05 PM
// Design Name: 
// Module Name: RegFile
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


module RegFile #(parameter n = 32)( input [4:0] read1,read2,write,
input [n-1:0] Write_Data,
input regWrite,clk,rst,
output [n-1:0] read_data1,read_data2
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
