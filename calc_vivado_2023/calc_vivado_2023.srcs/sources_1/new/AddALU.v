`timescale 1ns / 1ps

module AddALU(
    A,
    O
    );
    input [31:0] A;
    output reg [31:0] O;
    
    always @(*) begin
        O = A + 4;
    end
endmodule
