`timescale 1ns / 1ps

module RegistersBank(
    RA1,
    RA2,
    WA,
    WD,
    clk,
    REGWRITE,
    RD1,
    RD2
    );
    
    integer i;
    input [4:0] RA1;
    input [4:0] RA2;
    input [4:0] WA;
    input [31:0] WD;
    input REGWRITE;
    input clk;
    output reg [31:0] RD1;
    output reg [31:0] RD2;
    reg [31:0] registers [31:0];
    
    initial begin
        for (i = 0; i <= 31; i = i + 1) begin
            registers[i] = 0;
        end
    end
    always @(negedge clk) begin
        RD1 <= registers[RA1];
        RD2 <= registers[RA2];
    end
    always @(posedge clk) begin
        if (REGWRITE) begin // poate trebuie schimbat pe negedge
            registers[WA] <= WD;
        end
    end
endmodule
