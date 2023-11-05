module prv32_ALU(
	input [31:0] a,
	input [31:0] b,
	input [4:0] shamt,
	input [3:0] alufn,
	output reg [31:0] r,
	output cf, 
	output zf, 
	output vf, 
	output sf
);

    wire [31:0] add;
    wire [31:0] sub;
    wire [31:0] op_b;
    wire cfa;
    wire cfs;
    
    assign op_b = (~b);
    
    assign {cf, add} = alufn[0] ? (a + op_b + 1'b1) : (a + b);
    
    assign zf = (add == 0);
    assign sf = add[31];
    assign vf = (a[31] ^ (op_b[31]) ^ add[31] ^ cf);
    
    wire[31:0] sh;
    Shifter shifter0(.a(a), .shamt(shamt), .type(alufn[1:0]),  .r(sh)); //sent
    
    always @ * begin
        r = 0;
        (* parallel_case *)
        case (alufn)
            // arithmetic
            4'b00_00 : r = add;
            4'b00_01 : r = add;
            4'b00_11 : r = b;
            // logic
            4'b01_00:  r = a | b;
            4'b01_01:  r = a & b;
            4'b01_11:  r = a ^ b;
            // shift
            4'b10_00:  r=sh; // right
            4'b10_01:  r=sh; // left
            4'b10_10:  r=sh; // right arithmetic
            // slt & sltu
            4'b11_01:  r = {31'b0,(sf != vf)}; 
            4'b11_11:  r = {31'b0,(~cf)};            	
        endcase
    end
endmodule

