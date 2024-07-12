`timescale 1ns / 1ps

module ExtSign(
    din,
    dout
    );
    input [15:0] din;
    output wire [31:0] dout;
    
    assign dout = {{16{din[15]}}, din};
endmodule