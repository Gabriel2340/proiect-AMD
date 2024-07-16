`timescale 1ns / 1ps

module AddALU(
    A,
    B,
    O
    );
    input [31:0] A;
    input [31:0] B;
    output wire [31:0] O;
    assign O = A + B;
endmodule
