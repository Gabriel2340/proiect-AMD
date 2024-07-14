`timescale 1ns / 1ps

module MainControl(op, din, ZERO, REGDST, REGWRITE,
    EXTOP, ALUSRC, ALUOP, MEMWRITE, MEM2REG
    );
    input [5:0] op;
    input [5:0] din;
    input ZERO;
    output reg REGDST;
    output reg REGWRITE;
    output reg EXTOP;
    output reg ALUSRC;
    output reg [3:0] ALUOP;
    output reg MEMWRITE;
    output reg MEM2REG;
    
    always @(*) begin
        // Rtype
        case(op)
            6'b100000 : begin
                REGDST = 0;
                REGWRITE = 0;
                EXTOP = 0;
                ALUSRC = 0;
                ALUOP = 4'b0000;
                MEMWRITE = 0;
                MEM2REG = 0;
            end
            6'b100010 : begin
                REGDST = 0;
                REGWRITE = 0;
                EXTOP = 0;
                ALUSRC = 0;
                ALUOP = 4'b0000;
                MEMWRITE = 0;
                MEM2REG = 0;
            end
            6'b100100 : begin
                REGDST = 0;
                REGWRITE = 0;
                EXTOP = 0;
                ALUSRC = 0;
                ALUOP = 4'b0000;
                MEMWRITE = 0;
                MEM2REG = 0;
            end
            6'b100101 : begin
                REGDST = 0;
                REGWRITE = 0;
                EXTOP = 0;
                ALUSRC = 0;
                ALUOP = 4'b0000;
                MEMWRITE = 0;
                MEM2REG = 0;
            end
            6'b101010 : begin
                REGDST = 0;
                REGWRITE = 0;
                EXTOP = 0;
                ALUSRC = 0;
                ALUOP = 4'b0000;
                MEMWRITE = 0;
                MEM2REG = 0;
            end
        endcase
    end
    
    
endmodule
