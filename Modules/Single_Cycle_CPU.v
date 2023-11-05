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
    wire [31:0] inst,PC_out, next_PC, branch_target_addr;
    wire branch, memRead, memWrite, ALU_src1, ALU_src2, regWrite, PC_enable, jump;
    wire [1:0] ALUop, memToReg;
    wire [31:0] read_data1, read_data2;
    wire [31:0] gen_out;
    wire [31:0] ALU_in1, ALU_in2,write_mux_out1, write_mux_out2,PCmux_out;
    wire [3:0] ALU_sel;
    wire [31:0] ALU_out;
    wire z, c, s, v;
    wire [31:0] data_out;
    wire ALU_cu_mux_sel;
    wire [4:0] opcode;
    wire [2:0] func3;
    wire func7, func7_out;
    wire [4:0] rs1, rs2, rd;
    wire [31:0] branch_mux_out;
    wire PC_load;
    wire [7:0] inst_mem_addr, data_mem_addr;
    wire [4:0] shamt;
    
    assign next_PC = PC_out + 4;
    assign inst_mem_addr = PC_out[7:0];
    assign data_mem_addr = ALU_out[7:0];
    assign opcode = inst[6:2];
    assign rs1 = inst[19:15];
    assign rs2 = inst[24:20];
    assign rd = inst[11:7];
    assign func3 = inst[14:12];
    assign func7 = inst[30];
    assign ALU_cu_mux_sel = (func3 == 3'b000) && (opcode == 5'b00100);
    assign branch_target_addr = PC_out + gen_out;
    assign PC_load = PC_enable || ~inst[20];
    assign shamt = inst[24:20];
    
//    always @(*) begin
//        case (ledSel) 
//            0: LED_out = inst[15:0];
//            1: LED_out = inst[31:16];
//            2: LED_out = {00,branch,memRead,memToReg,ALUop,memWrite,ALUsrc,regWrite,ALU_sel,zero_flag,zero_flag&branch};
//            default: LED_out = 0;
//        endcase
//    end
    
//    always @(*) begin
//        case (SSD_sel) 
//            4'b0000: SSD_out = PC_out;
//            4'b0001: SSD_out = PC_out + 4;
//            4'b0010: SSD_out = shift_out + PC_out;
//            4'b0011: SSD_out = PCmux_out;
//            4'b0100: SSD_out = read_data1;
//            4'b0101: SSD_out = read_data2;
//            4'b0110: SSD_out = WriteMux_out;
//            4'b0111: SSD_out = gen_out;
//            4'b1000: SSD_out = shift_out;
//            4'b1001: SSD_out = ALUmux_out;
//            4'b1010: SSD_out = ALU_out;
//            4'b1011: SSD_out = data_out;
//        endcase
//    end

    NMUX ALU_mux_src1 (.A(read_data1),.B(PC_out),.sel(ALU_src1), .OUTPUT(ALU_in1));
    NMUX ALU_mux_src2 (.A(gen_out),.B(read_data2),.sel(ALU_src2), .OUTPUT(ALU_in2));
    NMUX #(.n(1)) ALU_cu_mux (.A(func7),.B(1'b0),.sel(ALU_cu_mux_sel), .OUTPUT(func7_out));
    NMUX write_mux1 (.A(ALU_out),.B(next_PC),.sel(memToReg[1]), .OUTPUT(write_mux_out1));
    NMUX write_mux2 (.A(data_out),.B(write_mux_out1),.sel(memToReg[0]), .OUTPUT(write_mux_out2));
    NMUX branch_mux (.A(next_PC),.B(branch_target_addr),.sel(branch_cu_out), .OUTPUT(branch_mux_out) );
    NMUX PCmux (.A(branch_mux_out),.B(ALU_out),.sel(jump), .OUTPUT(PCmux_out));
    
    Nbit_register PC(.D(PCmux_out),.clk(clk),.rst(rst),.load(PC_load),.Q(PC_out));
    nBit_shift shift(.A(gen_out),.B(shift_out));
    InstMem instMem(.addr(inst_mem_addr), .data_out(inst));
    RegFile regFile(.read1(rs1),.read2(rs2),.write(rd),.Write_Data(write_mux_out2),.regWrite(regWrite),.clk(clk),.rst(rst),.read_data1(read_data1),.read_data2(read_data2));
    DataMem dataMem(.clk(clk), .MemRead(memRead), .MemWrite(memWrite),.addr(data_mem_addr), .data_in(read_data2), .func_3(func3), .data_out(data_out));
    prv32_ALU alu(.a(ALU_in1), .b(ALU_in2), .r(ALU_out), .zf(z), .sf(s), .vf(v), .cf(c), .alufn(ALU_sel), .shamt(shamt));
    ImmGen i_gen(.IR(inst), .Imm(gen_out));
    
    Control_Unit cu(.opcode(opcode), .branch(branch), .memRead(memRead), .memToReg(memToReg), .memWrite(memWrite), .ALUsrc1(ALU_src1),.ALUsrc2(ALU_src2), .regWrite(regWrite), .ALUop(ALUop), .PC_enable(PC_enable), .jump(jump));
    ALU_CU alu_cu(.ALUop(ALUop), .func3(func3), .func7(func7_out), .ALU_sel(ALU_sel));
    Branch_CU branch_cu(.branch(branch), .Z(z), .C(c), .S(s), .V(v), .func3(func3), .branch_out(branch_cu_out));
    
endmodule
