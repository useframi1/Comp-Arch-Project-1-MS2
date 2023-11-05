`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AUC
// Engineer: Mariam ElGhobary & Youssef Elhagg
// 
// Create Date: 11/03/2023 05:04:12 PM
// Design Name: 
// Module Name: Single_Cycle_CPU_tb
// Project Name: Single Cycle rv32i Processor
// Target Devices: 
// Tool Versions: 
// Description: testbench
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Single_Cycle_CPU_tb();
    
    reg clk, rst;
    
    Single_Cycle_CPU cpu(.clk(clk), .rst(rst));
    
    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk;
    end
    
    initial begin
        rst = 1'b1;
        #20
        rst = 1'b0;
    
    end
    
endmodule
