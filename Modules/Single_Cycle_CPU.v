`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2023 06:23:35 PM
// Design Name: 
// Module Name: Single_Cycle_CPU
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


module Single_Cycle_CPU(
input clk, rst, 
input [1:0] ledSel,
input [3:0] SSD_sel,
output reg [15:0] LED_out,
output reg [12:0] SSD_out
    );
    wire [31:0] shift_out;
    wire [31:0] inst,PC_out;
    wire branch, memRead, memToReg, memWrite, ALUsrc, regWrite;
    wire [1:0] ALUop;
    wire [31:0] read_data1, read_data2;
    wire [31:0] gen_out;
    wire [31:0] ALUmux_out,WriteMux_out,PCmux_out;
    wire [3:0] ALU_sel;
    wire [31:0] ALU_out;
    wire zero_flag;
    wire [31:0] data_out;
    
    always @(*) begin
        case (ledSel) 
            0: LED_out = inst[15:0];
            1: LED_out = inst[31:16];
            2: LED_out = {00,branch,memRead,memToReg,ALUop,memWrite,ALUsrc,regWrite,ALU_sel,zero_flag,zero_flag&branch};
            default: LED_out = 0;
        endcase
    end
    
    always @(*) begin
        case (SSD_sel) 
            4'b0000: SSD_out = PC_out;
            4'b0001: SSD_out = PC_out + 4;
            4'b0010: SSD_out = shift_out + PC_out;
            4'b0011: SSD_out = PCmux_out;
            4'b0100: SSD_out = read_data1;
            4'b0101: SSD_out = read_data2;
            4'b0110: SSD_out = WriteMux_out;
            4'b0111: SSD_out = gen_out;
            4'b1000: SSD_out = shift_out;
            4'b1001: SSD_out = ALUmux_out;
            4'b1010: SSD_out = ALU_out;
            4'b1011: SSD_out = data_out;
        endcase
    end
    
    Nbit_register PC(.D(PCmux_out),.clk(clk),.rst(rst),.load(1'b1),.Q(PC_out) );
    nBit_shift shift(.A(gen_out),.B(shift_out));
    InstMem instMem(.addr(PC_out[7:2]), .data_out(inst));
    Control_Unit cu(.inst(inst[6:2]), .branch(branch), .memRead(memRead), .memToReg(memToReg), .memWrite(memWrite), .ALUsrc(ALUsrc), .regWrite(regWrite), .ALUop(ALUop));
    RegFile regFile(.read1(inst[19:15]),.read2(inst[24:20]),.write(inst[11:7]),.Write_Data(WriteMux_out),.regWrite(regWrite),.clk(clk),.rst(rst),.read_data1(read_data1),.read_data2(read_data2));
    NMUX ALUmux (.A(gen_out),.B(read_data2),.sel(ALUsrc), .OUTPUT(ALUmux_out) );
    NMUX WriteMux (.A(data_out),.B(ALU_out),.sel(memToReg), .OUTPUT(WriteMux_out) );
    NMUX PCmux (.A(shift_out + PC_out),.B(PC_out + 4),.sel(zero_flag & branch), .OUTPUT(PCmux_out) );
    immGen i_gen(.inst(inst), .gen_out(gen_out));
    ALU_CU alu_cu(.ALUop(ALUop), .inst_1(inst[14:12]), .inst_2(inst[30]), .ALU_sel(ALU_sel));
    Nbit_ALU alu(.A(read_data1), .B(ALUmux_out), .ALU_out(ALU_out), .zero_flag(zero_flag), .sel(ALU_sel));
    DataMem dataMem(.clk(clk), .MemRead(memRead), .MemWrite(memWrite),.addr(ALU_out[7:2]), .data_in(read_data2), .data_out(data_out));
    
endmodule
