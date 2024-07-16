`timescale 1ns / 1ps

module ExtSign(
    din,
    EXTOP,
    dout
    );
    input [15:0] din;
    input EXTOP;
    output wire [31:0] dout;
    
    assign dout = (EXTOP == 1) ? {{16{din[15]}}, din} : {16'h0000, din};
endmodule