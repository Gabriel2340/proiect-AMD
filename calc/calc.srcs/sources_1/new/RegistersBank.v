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
    input [4:0] RA1;
    input [4:0] RA2;
    input [4:0] WA;
    input [31:0] WD;
    input REGWRITE;
    input clk;
    output reg [31:0] RD1;
    output reg [31:0] RD2;
    
endmodule
