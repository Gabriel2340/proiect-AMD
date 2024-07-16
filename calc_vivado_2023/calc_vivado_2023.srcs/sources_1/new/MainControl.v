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
        if (op == 0) begin
            case(din)
                6'h20 : begin // ADD
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b0010;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                end
                6'h21 : begin // ADDU
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b0010;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                end
                6'h22 : begin // SUB
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b0110;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                end
                6'h24 : begin // AND
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b0000;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                end
                6'h25 : begin // OR
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b0001;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                end
                6'h27 : begin // NOR
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b1100;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                end
                6'h2a : begin // SLT
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b0111;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                end
                6'h2b : begin // SLTU
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b1000;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                end
            endcase
        end else begin //Itype
            case(op)
                6'b001000 : begin // ADDI
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 4'b0010;
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                end
                6'b011001 : begin // LHI
                    
                end
                6'b011000 : begin // LOI
                    
                end
            endcase
        end
    end
endmodule
