`timescale 1ns / 1ps

module MainControl(op, din, ZERO, REGDST, REGWRITE,
    EXTOP, ALUSRC, ALUOP, MEMWRITE, MEM2REG, SHAMT, JUMP, BRANCH
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
    output reg SHAMT;
    output reg JUMP;
    output reg BRANCH;
    
    always @(*) begin
        // Rtype
        if (op == 0) begin
            case(din)
                6'h00 : begin // SLL
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b1001;
                    EXTOP <= 0;
                    ALUSRC <= 1;
                    SHAMT <= 1;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
                6'h02 : begin // SRL
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b1010;
                    EXTOP <= 0;
                    ALUSRC <= 1;
                    SHAMT <= 1;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
                6'h08 : begin // JR nu e gata
                    REGWRITE <= 0;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 0;
                    ALUOP <= 4'b0000;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 1;
                    BRANCH <= 0;
                end
                6'h20 : begin // ADD
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b0010;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
                6'h21 : begin // ADDU = ADD
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b0010;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
                6'h22 : begin // SUB
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b0110;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
                6'h23 : begin // SUBU = SUB
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b0110;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
                6'h24 : begin // AND
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b0000;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
                6'h25 : begin // OR
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b0001;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
                6'h27 : begin // NOR
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b1100;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
                6'h2a : begin // SLT
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b0111;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
                6'h2b : begin // SLTU
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 4'b1000;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
            endcase
        end else begin //Itype
            case(op) // skipped: BNE, JAL, LBU, LHU, LL, LUI, SLTI, SLTIU, SB, SC, SH
                6'h02 : begin // J
                    REGDST <= 0;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    ALUOP <= 4'b0000;
                    REGWRITE <= 0;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 1;
                    BRANCH <= 0;
                end
                6'h04 : begin // BEQ
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 0;
                    ALUOP <= 4'b0110;
                    REGWRITE <= 0;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 1;
                end
                6'h08 : begin // ADDI
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 4'b0010;
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
                6'h09 : begin // ADDIU = ADDI
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 4'b0010;
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
                6'h0c : begin // ANDI
                    REGDST <= 0;
                    EXTOP <= 0;
                    ALUSRC <= 1;
                    ALUOP <= 4'b0000;
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
                6'h0d : begin // ORI
                    REGDST <= 0;
                    EXTOP <= 0;
                    ALUSRC <= 1;
                    ALUOP <= 4'b0001;
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
                6'h23 : begin // LW
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 4'b0010;
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
                6'h2b : begin // SW
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 4'b0010;
                    REGWRITE <= 0;
                    MEMWRITE <= 1;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                end
            endcase
        end
    end
endmodule
