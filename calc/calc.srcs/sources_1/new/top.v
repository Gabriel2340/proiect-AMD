`timescale 1ns / 1ps
// TODO: rezolva RD1 si RD2, se updateaza cu un clock dupa
module top(
    clk
    );
    input clk;

    wire [31:0] instr;
    wire [31:0] pc_din;
    wire [31:0] pc_dout;
    wire ZERO;
    wire REGDST;
    wire REGWRITE;
    wire EXTOP;
    wire ALUSRC;
    wire [3:0] ALUOP;
    wire MEMWRITE;
    wire MEM2REG;
    wire [31:0] ext_dout;
    wire [31:0] RD1;
    wire [31:0] RD2;
    wire [31:0] ALU_B;
    wire [31:0] ALU_out;
    wire [31:0] RD;
    wire [31:0] mem2reg_out;
    wire [4:0] dst_out;
    
    PC pc_1(.din(pc_din), .clk(clk), .dout(pc_dout));
    IM im_1(.adr(pc_dout), .instr(instr));
    AddALU add_alu(.A(pc_dout), .clk(clk), .O(pc_din));
    MainControl main_control_1(.op(instr[31:26]), .din(instr[5:0]), .ZERO(ZERO),
                .REGDST(REGDST), .REGWRITE(REGWRITE), .EXTOP(EXTOP), .ALUSRC(ALUSRC),
                .ALUOP(ALUOP), .MEMWRITE(MEMWRITE), .MEM2REG(MEM2REG));
    ExtSign ext_sign_1(.din(instr[15:0]), .EXTOP(EXTOP), .dout(ext_dout));
    MUX2_1 #(.N(5)) mux2_1_dst(.A(instr[20:16]), .B(instr[15:11]), .sel(REGDST), .O(dst_out));
    RegistersBank registers_bank_1(.RA1(instr[25:21]), .RA2(instr[20:16]), .WA(dst_out),
                .WD(mem2reg_out), .clk(clk), .REGWRITE(REGWRITE), .RD1(RD1), .RD2(RD2));
    MUX2_1 mux2_1_alu(.A(RD2), .B(ext_dout), .sel(ALUSRC), .O(ALU_B));
    ALU alu_1(.D1(RD1), .D2(ALU_B), .sel(ALUOP), .ZERO(ZERO), .Dout(ALU_out));
    DM dm_1(.adr(ALU_out), .WD(RD2), .clk(clk), .MEMWRITE(MEMWRITE), .RD(RD));
    MUX2_1 mux_2_1_mem(.A(RD), .B(ALU_out), .sel(MEM2REG), .O(mem2reg_out));
endmodule


module tb;
    reg clk;
    
    initial begin
        clk = 0;
        repeat(19) begin
            #10 clk = !clk;
        end
        #10 $finish;
    end
    
    top top_1(.clk(clk));
endmodule