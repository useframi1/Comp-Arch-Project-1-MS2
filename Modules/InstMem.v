`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2023 04:53:04 PM
// Design Name: 
// Module Name: InstMem
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


module InstMem (input [7:0] addr, output [31:0] data_out);
 reg [7:0] mem [0:255];
 initial begin
    {mem[0], mem[1], mem[2], mem[3]} =     32'b00000000000000001010000010010111; //auipc x1, 10 
    {mem[4], mem[5], mem[6], mem[7]} =     32'b11111111111111111011000100010111; //auipc x2, -5
    {mem[8], mem[9], mem[10], mem[11]} =   32'b00000000000000001010000110110111; //lui x3, 10
    {mem[12], mem[13], mem[14], mem[15]} = 32'b11111111111111111011001000110111; //lui x4, -5






 end

 assign data_out = {mem[addr], mem[addr + 1], mem[addr + 2], mem[addr + 3]};
endmodule