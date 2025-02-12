`timescale 1ns / 1ps


module IM(
    adr,
    instr
    );
    input [31:0] adr;
    output reg [31:0] instr;
    
    reg [7:0] mem [65535:0];
    
    initial begin
        $readmemh("instr.mem", mem);
    end
    
    always @(*) begin
        instr = {mem[adr], mem[adr + 1], mem[adr + 2], mem[adr + 3]};
    end
    
endmodule
