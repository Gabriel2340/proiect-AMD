`timescale 1ns / 1ps


module IM(
    adr,
    instr
    );
    parameter N = 32;
    parameter M = 32;
    
    input [M-1:0] adr;
    output reg [N-1:0] instr;
    
    reg [N-1:0] mem [99:0];
    
    initial begin
        $readmemh("instr.mem", mem);
    end
    
    always @(*) begin
        instr = mem[adr];
    end
endmodule
