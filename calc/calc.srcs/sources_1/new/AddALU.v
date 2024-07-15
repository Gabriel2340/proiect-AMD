`timescale 1ns / 1ps

module AddALU(
    A,
    clk,
    O
    );
    input [31:0] A;
    input clk;
    output reg [31:0] O = 0;
    
    always @(posedge clk) begin
        O = A + 4;
    end
endmodule
