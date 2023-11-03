`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2023 06:34:23 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
input [4:0] inst, 
output reg branch, memRead, memToReg, memWrite, ALUsrc, regWrite,
output reg [1:0] ALUop
    );
    
    always @(*) begin
        case (inst)
        
            5'b01100: begin // R-format
                branch = 0;
                memRead = 0;
                memToReg = 0;
                ALUop = 2'b10;
                memWrite = 0;
                ALUsrc = 0;
                regWrite = 1;
            end
            
            5'b00000: begin // LW
                branch = 0;
                memRead = 1;
                memToReg = 1;
                ALUop = 2'b00;
                memWrite = 0;
                ALUsrc = 1;
                regWrite = 1;
            end
            
            5'b01000: begin // SW
                branch = 0;
                memRead = 0;
                memToReg = 0;
                ALUop = 2'b00;
                memWrite = 1;
                ALUsrc = 1;
                regWrite = 0;
            end
            
            5'b11000: begin // BEQ
                branch = 1;
                memRead = 0;
                memToReg = 0;
                ALUop = 2'b01;
                memWrite = 0;
                ALUsrc = 0;
                regWrite = 0;
            end
            
            default: begin
                branch = 0;
                memRead = 0;
                memToReg = 0;
                ALUop = 2'b00;
                memWrite = 0;
                ALUsrc = 0;
                regWrite = 0;
            end
        
        endcase
    
    end
    
endmodule
