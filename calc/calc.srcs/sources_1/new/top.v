`timescale 1ns / 1ps

module top(
    clk
    );
    input clk;
    
    wire [31:0] instr;
    wire [31:0] pc_din;
    wire [31:0] pc_dout;
    wire [31:0] ext_dout;
    wire [31:0] RD1;
    wire [31:0] RD2;
    wire [31:0] ALU_B;
    wire [31:0] ALU_out;
    wire [31:0] RD;
    wire [31:0] mem2reg_out;
    wire [31:0] sh_out;
    wire [31:0] add_alu_1_out;
    wire [31:0] add_alu_2_out;
    wire [31:0] mux2_1_adds_out;
    wire [31:0] pc2reg_out;
    wire [31:0] jump_out;
    wire [4:0] dst_out;
    wire [4:0] ALUOP;
    wire [2:0] REGWRITE;
    wire [1:0] MEMWRITE;
    wire ZERO;
    wire REGDST;
    wire EXTOP;
    wire ALUSRC;
    wire MEM2REG;
    wire SHAMT;
    wire JUMP;
    wire BRANCH;
    wire PC2REG;
    wire JREG;
    
    PC pc_1(.din(pc_din), .clk(clk), .dout(pc_dout));
    IM im_1(.adr(pc_dout), .instr(instr));
    
    AddALU add_alu_1(.A(pc_dout), .B(32'h00000004), .O(add_alu_1_out));
    AddALU add_alu_2(.A(add_alu_1_out), .B({ext_dout[29:0],2'b00}), .O(add_alu_2_out));
    
    MUX2_1 mux2_1_adds(.A(add_alu_1_out), .B(add_alu_2_out), .sel(BRANCH), .O(mux2_1_adds_out));
    MUX2_1 mux2_1_jump(.A(mux2_1_adds_out), .B({add_alu_1_out[31:28],instr[25:0],2'b00}), .sel(JUMP), .O(jump_out));
    MUX2_1 mux2_1_sh(.A(ext_dout), .B({{27{1'b0}}, instr[10:6]}), .sel(SHAMT), .O(sh_out));
    MUX2_1 mux2_1_alu(.A(RD2), .B(sh_out), .sel(ALUSRC), .O(ALU_B));
    MUX2_1 mux_2_1_mem(.A(RD), .B(ALU_out), .sel(MEM2REG), .O(mem2reg_out));
    MUX2_1 mux_2_1_pc2reg(.A(mem2reg_out), .B(add_alu_1_out), .sel(PC2REG), .O(pc2reg_out));
    MUX2_1 mux_2_1_jreg(.A(jump_out), .B(RD1), .sel(JREG), .O(pc_din));
    MUX2_1 #(.N(5)) mux2_1_dst(.A(instr[20:16]), .B(instr[15:11]), .sel(REGDST), .O(dst_out));
    
    MainControl main_control_1(.op(instr[31:26]), .din(instr[5:0]), .ZERO(ZERO), .REGDST(REGDST),
                .REGWRITE(REGWRITE), .EXTOP(EXTOP), .ALUSRC(ALUSRC), .ALUOP(ALUOP),
                .MEMWRITE(MEMWRITE), .MEM2REG(MEM2REG), .SHAMT(SHAMT), .JUMP(JUMP), .BRANCH(BRANCH),
                .PC2REG(PC2REG), .JREG(JREG));
    ExtSign ext_sign_1(.din(instr[15:0]), .EXTOP(EXTOP), .dout(ext_dout));
    RegistersBank registers_bank_1(.RA1(instr[25:21]), .RA2(instr[20:16]), .WA(dst_out),
                .WD(pc2reg_out), .clk(clk), .REGWRITE(REGWRITE), .RD1(RD1), .RD2(RD2));
    ALU alu_1(.D1(RD1), .D2(ALU_B), .sel(ALUOP), .ZERO(ZERO), .Dout(ALU_out));
    DM dm_1(.adr(ALU_out), .WD(RD2), .clk(clk), .MEMWRITE(MEMWRITE), .RD(RD));
endmodule

module tb;
    reg clk;
    
    initial begin
        clk = 0;
        repeat(61) begin
            #10 clk = !clk;
        end
        #10 $finish;
    end
    
    top top_1(.clk(clk));
endmodule