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
    reg [31:0] mem [99:0];
    
    assign RD = mem[adr];

    always @(posedge clk) begin
        if (MEMWRITE)
            mem[adr] = WD;
    end
endmodule
