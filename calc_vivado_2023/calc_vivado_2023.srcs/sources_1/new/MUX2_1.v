`timescale 1ns / 1ps

module MUX2_1(
    A,
    B,
    sel,
    O
    );
    parameter N = 32;

    input [N-1:0] A;
    input [N-1:0] B;
    input sel;
    output [N-1:0] O;

    assign O = (sel) ? B : A;
endmodule
