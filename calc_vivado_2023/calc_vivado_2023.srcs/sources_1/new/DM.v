`timescale 1ns / 1ps

module DM(
    adr,
    SWin,
    WD,
    clk,
    MEMWRITE,
    RD,
    LEDout
    );
    integer i;
    parameter MAX_MEM = 32'hffff;
    input [31:0] adr;
    input [31:0] WD;
    input clk;
    input MEMWRITE;
    input [15:0] SWin;
    output [15:0] LEDout;
    output wire [31:0] RD;
    reg [7:0] mem [MAX_MEM-1:0];
    
    assign RD = {mem[adr], mem[adr + 1], mem[adr + 2], mem[adr + 3]};
    assign LEDout = {mem[SWin], mem[SWin + 1]};
    
    always @(posedge clk) begin
        if (MEMWRITE) begin
            mem[adr] <= WD[31:24];
            mem[adr + 1] <= WD[23:16];
            mem[adr + 2] <= WD[15:8];
            mem[adr + 3] <= WD[7:0];
        end
    end
endmodule
