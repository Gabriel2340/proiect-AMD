`timescale 1ns / 1ps

module cnt(
    clk,
    n
    );
    input clk;
    output reg [1:0] n = 0;
    
    always @(posedge clk) begin
        n = n + 1;
    end
endmodule
