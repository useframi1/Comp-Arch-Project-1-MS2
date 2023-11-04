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
     mem[0]=8'b00000000;
     mem[1] = 8'b0000_0000;
     mem[2] = 8'b0_010_0000;
     mem[3] = 8'b1_0000011 ; //lw x1, 0(x0) 
     mem[4]=8'b0000000_0;
     mem[5] = 8'b0000_0000;
     mem[6] = 8'b1_110_0010;
     mem[7] = 8'b0_0110011 ; //or x4, x1, x0 
     mem[8]=8'b0000000_0;
     mem[9] = 8'b0100_0000;
     mem[10] = 8'b0_010_0110;
     mem[11] = 8'b0_0100011; //sw x4, 12(x0)
 end

 assign data_out = {mem[addr], mem[addr + 1], mem[addr + 2], mem[addr + 3]};
endmodule