`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AUC
// Engineer: Mariam ElGhobary & Youssef Elhagg
// 
// Create Date: 11/03/2023 05:04:12 PM
// Design Name: 
// Module Name: InstMem
// Project Name: Single Cycle rv32i Processor
// Target Devices: 
// Tool Versions: 
// Description: the instruction memory of the processor
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module InstMem (
    input [7:0] addr, 
    output [31:0] data_out
);
     reg [7:0] mem [0:255];
     initial begin
        {mem[3], mem[2], mem[1], mem[0]} = 32'b00000000101000000000000010010011; //addi x1, x0, 10 #x1=10
        {mem[7], mem[6], mem[5], mem[4]} = 32'b11111111101100000000000100010011; //addi x2, x0, -5 #x2=-5
        {mem[11], mem[10], mem[9], mem[8]} = 32'b00000000001000001000000110110011; //add  x3, x1, x2 #x3=5
        {mem[15], mem[14], mem[13], mem[12]} = 32'b01000000001000001000001000110011; //sub  x4, x1, x2 #x4=15
        {mem[19], mem[18], mem[17], mem[16]} = 32'b00000000001000001100001010110011; //xor  x5, x1, x2 #x5=-15
        {mem[23], mem[22], mem[21], mem[20]} = 32'b00000000001000001110001100110011; //or   x6, x1, x2 #x6=-5
        {mem[27], mem[26], mem[25], mem[24]} = 32'b00000000001000001111001110110011; //and  x7, x1, x2 #x7=10
        {mem[31], mem[30], mem[29], mem[28]} = 32'b00000000101000010001010000110011; //sll  x8, x2, x1 #x8=-5120
        {mem[35], mem[34], mem[33], mem[32]} = 32'b00000000101000010101010010110011; //srl  x9, x2, x1 #x9=4194303
        {mem[39], mem[38], mem[37], mem[36]} = 32'b01000000101000010101010100110011; //sra  x10,x2, x1 #x10=-1
        {mem[43], mem[42], mem[41], mem[40]} = 32'b00000000001000001010010110110011; //slt  x11,x1,x2  #x11=0
        {mem[47], mem[46], mem[45], mem[44]} = 32'b00000000001000001011011000110011; //sltu x12,x1,x2  #x12=1
        
    
     end
    
     assign data_out = {mem[addr + 3], mem[addr + 2], mem[addr + 1], mem[addr]};
endmodule