`timescale 1ns / 1ps

module RegistersBank(
    RA1,
    RA2,
    WA,
    WD,
    clk,
    REGWRITE,
    RD1,
    RD2
    );
    
    integer i;
    input [31:0] WD;
    input [4:0] RA1;
    input [4:0] RA2;
    input [4:0] WA;
    input [2:0] REGWRITE;
    input clk;
    output wire [31:0] RD1;
    output wire [31:0] RD2;
    reg [31:0] registers [31:0];
    
    assign RD1 = registers[RA1];
    assign RD2 = registers[RA2];
    
    initial begin
        for (i = 0; i <= 31; i = i + 1) begin
            registers[i] = 0;
        end
    end
   
    always @(posedge clk) begin
        if (REGWRITE == 1) begin // LW & write registers
            registers[WA] <= WD;
        end
        if (REGWRITE == 2) begin // LUI
            registers[WA] <= {WD[15:0], 16'b0};
        end
        if (REGWRITE == 3) begin // LHU
            registers[WA] <= {16'b0, WD[15:0]};
        end
        if (REGWRITE == 4) begin // LBU
            registers[WA] <= {24'b0, WD[7:0]};
        end
        if (REGWRITE == 5) begin // JAL & JALR
            registers[31] <= WD;
        end
        if (REGWRITE == 6) begin // LB
            registers[WA] <= {{24{WD[7]}},WD[7:0]};
        end
        if (REGWRITE == 7) begin // LH
            registers[WA] <= {{16{WD[15]}},WD[15:0]};
        end
    end
endmodule
