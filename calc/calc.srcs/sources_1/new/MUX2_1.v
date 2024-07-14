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
    output O;

    assign O = (sel == 0) ? A : B;
endmodule
