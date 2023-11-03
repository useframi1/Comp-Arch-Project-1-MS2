`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2023 05:54:44 PM
// Design Name: 
// Module Name: immGen
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


module immGen (output reg [31:0] gen_out, input [31:0] inst);

always @(*) begin

    case(inst[6])
    
        
        1'b1: gen_out = {{20{inst[31]}},{inst[31],inst[7],inst[30:25],inst[11:8]}};
        1'b0: begin
                case(inst[5]) 
                    1'b1: gen_out = {{20{inst[31]}},{inst[31:25],inst[11:7]}};
                    1'b0: gen_out = {{20{inst[31]}},inst[31:20]};
                
                endcase
            end   
    endcase

end

endmodule