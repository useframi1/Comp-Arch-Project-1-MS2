`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AUC
// Engineer: Mariam ElGhobary & Youssef Elhagg
// 
// Create Date: 10/10/2023 07:02:33 PM
// Design Name: 
// Module Name: CPU_TOP
// Project Name: Single Cycle rv32i Processor
// Target Devices: 
// Tool Versions: 
// Description: The top module that combines the CPU and 7-segment driver
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CPU_TOP (
    input CPU_clk, 
    input SSD_clk,
    input rst,
    input [1:0] ledSel,
    input [3:0] SSD_sel,
    output [15:0] LED_out,
    output [3:0] Anode,
    output [6:0] SSD_LED_out 
);
    
    wire [12:0] SSD_out;
    Single_Cycle_CPU cpu (.clk(CPU_clk), .rst(rst), .ledSel(ledSel), .SSD_sel(SSD_sel), .LED_out(LED_out), .SSD_out(SSD_out));
    Four_Digit_Seven_Segment_Driver FDSSD (.clk(SSD_clk), .num(SSD_out), .Anode(Anode), .LED_out(SSD_LED_out));
    
endmodule
