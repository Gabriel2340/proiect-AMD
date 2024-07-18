`timescale 1ns / 1ps

module divizor(
    clk,
    clk_out
    );
    input clk;
    output reg clk_out = 0;
    reg [31:0] copy = 60_000;
    reg [31:0] count = 0;
    always @ (posedge clk) begin
        if (count >= copy) begin
            count = 0;
            clk_out = !clk_out;
        end
        count = count + 1;
    end
endmodule

