`timescale 1ns / 1ps

module DM(
    adr,
    RD,
    WD,
    clk,
    MEMWRITE
    );
    input [31:0] adr;
    input [31:0] WD;
    input clk;
    input [1:0] MEMWRITE;
    output wire [31:0] RD;
    reg [7:0] mem [65535:0];
    
    assign RD = {mem[adr], mem[adr + 1], mem[adr + 2], mem[adr + 3]};
    
    always @(posedge clk) begin
        if (MEMWRITE == 3) begin // SW
            mem[adr] <= WD[31:24];
            mem[adr + 1] <= WD[23:16];
            mem[adr + 2] <= WD[15:8];
            mem[adr + 3] <= WD[7:0];
        end
        if (MEMWRITE == 2) begin // SH
            mem[adr] <= WD[15:8];
            mem[adr + 1] <= WD[7:0];
        end
        if (MEMWRITE == 1) begin // SB
            mem[adr] <= WD[7:0];
        end
    end
endmodule
