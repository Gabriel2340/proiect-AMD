`timescale 1ns / 1ps

module PC(
    din,
    clk,
    dout
    );
    input [31:0] din;
    input clk;
    output reg [31:0] dout = 0;
    
    always @(posedge clk) begin
        dout = din;
    end
endmodule
