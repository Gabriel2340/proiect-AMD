`timescale 1ns / 1ps

module DM(
    adr,
    WD,
    clk,
    MEMWRITE,
    RD
    );
    input [31:0] adr;
    input [31:0] WD;
    input clk;
    input MEMWRITE;
    output wire [31:0] RD;
    reg [7:0] mem [399:0];
    
    assign RD = {mem[adr], mem[adr + 1], mem[adr + 2], mem[adr + 3]};

    always @(posedge clk) begin
        if (MEMWRITE) begin
            mem[adr] <= WD[31:24];
            mem[adr + 1] <= WD[23:16];
            mem[adr + 2] <= WD[15:8];
            mem[adr + 3] <= WD[7:0];
        end
    end
endmodule
