`timescale 1ns / 1ps

module AddALU(
    A,
    O
    );
    input [31:0] A;
    output wire [31:0] O;
    assign O = A + 4;
endmodule
