`timescale 1ns / 1ps

module MainControl(op, din, ALU_OUT, ZERO, REGDST, REGWRITE, EXTOP,
    ALUSRC, ALUOP, MEMWRITE, MEM2REG, SHAMT, JUMP, BRANCH, PC2REG, JREG
    );
    input [31:0] ALU_OUT;
    input [5:0] op;
    input [5:0] din;
    input ZERO;
    output reg [4:0] ALUOP;
    output reg [2:0] REGWRITE;
    output reg [1:0] MEMWRITE;
    
    output reg REGDST;
    output reg EXTOP;
    output reg ALUSRC;
    output reg MEM2REG;
    output reg SHAMT;
    output reg JUMP;
    output reg BRANCH;
    output reg PC2REG;
    output reg JREG;
    
    always @(*) begin
        // Rtype
        if (op == 0) begin
            case(din)                     
                6'h00 : begin // SLL      
                    REGWRITE <= 1;        
                    MEMWRITE <= 0;        
                    MEM2REG <= 1;         
                    REGDST <= 1;          
                    ALUOP <= 5'b01001;    
                    EXTOP <= 0;           
                    ALUSRC <= 1;          
                    SHAMT <= 1;           
                    JUMP <= 0;            
                    BRANCH <= 0;          
                    PC2REG <= 0;          
                    JREG <= 0;            
                end
                6'h02 : begin // SRL
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b01010;
                    EXTOP <= 0;
                    ALUSRC <= 1;
                    SHAMT <= 1;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h03 : begin // SRA
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b01011;
                    EXTOP <= 0;
                    ALUSRC <= 1;
                    SHAMT <= 1;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h04 : begin // SLLV
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b01001;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h06 : begin // SRLV
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b01010;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h07 : begin // SRAV
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b01011;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h08 : begin // JR
                    REGWRITE <= 0;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 0;
                    ALUOP <= 5'b00000;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 1;
                end
                6'h09 : begin // JALR
                    REGWRITE <= 5;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 0;
                    ALUOP <= 5'b00000;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 1;
                    JREG <= 1;
                end
                6'h10 : begin // MFHI
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b10000;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h11 : begin // MTHI
                    REGWRITE <= 0;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b10001;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h12 : begin // MFLO
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b10010;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h13 : begin // MTLO
                    REGWRITE <= 0;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b10011;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h18 : begin // MULT = MULTU
                    REGWRITE <= 0;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b01101;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h19 : begin // MULTU
                    REGWRITE <= 0;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b01101;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h1a : begin // DIV = DIVU
                    REGWRITE <= 0;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b01110;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h1b : begin // DIVU
                    REGWRITE <= 0;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b01110;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h20 : begin // ADD
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b00010;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h21 : begin // ADDU
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b00010;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h22 : begin // SUB
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b00110;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h23 : begin // SUBU
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b00110;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h24 : begin // AND
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b00000;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h25 : begin // OR
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b00001;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h26 : begin // XOR
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b00011;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h27 : begin // NOR
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b01100;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h2a : begin // SLT
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b00111;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h2b : begin // SLTU
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    REGDST <= 1;
                    ALUOP <= 5'b01000;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
            endcase
        end else begin //Itype & Jtype
            case(op)
                6'h02 : begin // J
                    REGDST <= 0;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    ALUOP <= 5'b00000;
                    REGWRITE <= 0;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 1;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h03 : begin // JAL
                    REGDST <= 0;
                    EXTOP <= 0;
                    ALUSRC <= 0;
                    ALUOP <= 5'b00000;
                    REGWRITE <= 5;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 1;
                    BRANCH <= 0;
                    PC2REG <= 1;
                    JREG <= 0;
                end
                6'h04 : begin // BEQ
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 0;
                    ALUOP <= 5'b00110;
                    REGWRITE <= 0;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= ZERO;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h05 : begin // BNE
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 0;
                    ALUOP <= 5'b00110;
                    REGWRITE <= 0;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= !ZERO;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h06 : begin // BLEZ
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 0;
                    ALUOP <= 5'b00101;
                    REGWRITE <= 0;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= ALU_OUT[0];
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h07 : begin // BGTZ
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 0;
                    ALUOP <= 5'b00101;
                    REGWRITE <= 0;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= !ALU_OUT[0];
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h08 : begin // ADDI
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 5'b00010;
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h09 : begin // ADDIU
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 5'b00010;
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h0a : begin // SLTI
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 5'b00111;
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h0b : begin // SLTIU
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 5'b01000;
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h0c : begin // ANDI
                    REGDST <= 0;
                    EXTOP <= 0;
                    ALUSRC <= 1;
                    ALUOP <= 5'b00000;
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h0d : begin // ORI
                    REGDST <= 0;
                    EXTOP <= 0;
                    ALUSRC <= 1;
                    ALUOP <= 5'b00001;
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h0e : begin // XORI
                    REGDST <= 0;
                    EXTOP <= 0;
                    ALUSRC <= 1;
                    ALUOP <= 5'b00011;
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h0f : begin // LUI
                    REGDST <= 0;
                    EXTOP <= 0;
                    ALUSRC <= 1;
                    ALUOP <= 5'b00010;
                    REGWRITE <= 2;
                    MEMWRITE <= 0;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h20 : begin // LB
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 5'b00010;
                    REGWRITE <= 6;
                    MEMWRITE <= 0;
                    MEM2REG <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h21 : begin // LH
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 5'b00010;
                    REGWRITE <= 7;
                    MEMWRITE <= 0;
                    MEM2REG <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h23 : begin // LW
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 5'b00010;
                    REGWRITE <= 1;
                    MEMWRITE <= 0;
                    MEM2REG <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h24 : begin // LBU
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 5'b00010;
                    REGWRITE <= 4;
                    MEMWRITE <= 0;
                    MEM2REG <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h25 : begin // LHU
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 5'b00010;
                    REGWRITE <= 3;
                    MEMWRITE <= 0;
                    MEM2REG <= 0;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h28 : begin // SB
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 5'b00010;
                    REGWRITE <= 0;
                    MEMWRITE <= 1;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h29 : begin // SH
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 5'b00010;
                    REGWRITE <= 0;
                    MEMWRITE <= 2;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
                6'h2b : begin // SW
                    REGDST <= 0;
                    EXTOP <= 1;
                    ALUSRC <= 1;
                    ALUOP <= 5'b00010;
                    REGWRITE <= 0;
                    MEMWRITE <= 3;
                    MEM2REG <= 1;
                    SHAMT <= 0;
                    JUMP <= 0;
                    BRANCH <= 0;
                    PC2REG <= 0;
                    JREG <= 0;
                end
            endcase
        end
    end
endmodule
