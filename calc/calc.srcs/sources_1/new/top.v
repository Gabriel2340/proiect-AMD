`timescale 1ns / 1ps

module top(
    
    );
    reg [31:0] adr; // TBD
    wire [31:0] instr;
    
    IM im_1(.adr(adr), .instr(instr));
    RegistersBank registers_bank_1(.RA1(instr[25:21]), .RA2(instr[20:16]));
    
endmodule
