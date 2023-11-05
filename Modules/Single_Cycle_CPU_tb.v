`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2023 04:33:21 PM
// Design Name: 
// Module Name: Single_Cycle_CPU_tb
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


module Single_Cycle_CPU_tb(

    );
    
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
