`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2023 05:04:12 PM
// Design Name: 
// Module Name: DataMem
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


module DataMem
 (input clk, input MemRead, input MemWrite,
 input [7:0] addr, input [31:0] data_in, input [2:0] func_3, output reg [31:0] data_out);
 
 reg [7:0] mem [0:255];
 initial begin
     mem[0]=8'd17;
     mem[1]=8'd0;
     mem[2]=8'd0;
     mem[3]=8'd0;
     mem[4]=8'd9;
     mem[5]=8'd0;
     mem[6]=8'd0;
     mem[7]=8'd0;
     mem[8]=8'd25;
     mem[9]=8'd0;
     mem[10]=8'd0;
     mem[11]=8'd0; 
 end
 
 
 always @(posedge clk) begin
    if(MemWrite) begin
        case(func_3)
            0: mem[addr] <= data_in[7:0];    //sb 
            1: begin //sh
                    mem[addr] <= data_in[7:0];
                    mem[addr+1] <= data_in[15:8];
            end
            default: begin //sw
                        mem[addr] <= data_in[7:0];
                        mem[addr+1] <= data_in[15:8];
                        mem[addr+2] <= data_in[23:16];
                        mem[addr+3] <= data_in[31:24];
            end
        endcase
    end
    else mem[addr] <= mem[addr]  //no change
        
 end
 
 always @(*) begin
    if (MemRead) begin
        case(func_3)
        0: begin //lb sign-extended
            if(mem[addr][7]==1'b1) data_out= {24'b1, mem[addr]}; 
            else data_out= {24'b0, mem[addr]};
        end
        1: begin //lh sign-extended
            if(mem[addr+1][7]==1'b1) data_out= {16'b1, mem[addr+1], mem[addr]}; 
            else data_out= {16'b0, mem[addr+1], mem[addr]};
        end
        2: data_out= {mem[addr+3], mem[addr+2], mem[addr+1], mem[addr]}; //lw
        4: data_out= {24'b0, mem[addr]}; //lbu zero-extended
        5: data_out= {16'b0, mem[addr+1], mem[addr]}; //lhu zero-extended
        default: data_out= {mem[addr+3], mem[addr+2], mem[addr+1], mem[addr]}; //lw
        endcase
    end
    else data_out=0; //ask?
 end
 
 
endmodule