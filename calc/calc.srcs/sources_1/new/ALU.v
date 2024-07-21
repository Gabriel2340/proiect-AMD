`timescale 1ns / 1ps

module ALU(
    D1,
    D2,
    sel,
    ZERO,
    Dout
    );
    input [31:0] D1;
    input [31:0] D2;
    input [4:0] sel;
    output reg ZERO;
    output reg [31:0] Dout;
    
    reg [31:0] HI = 0;
    reg [31:0] LO = 0;
    
    always @(*) begin
        case(sel)
            0: Dout <= D1 & D2; // AND
            1: Dout <= D1 | D2; // OR
            2: Dout <= D1 + D2; // ADD
            3: Dout <= D1 ^ D2; // XOR
            5: Dout <= (D1 <= D2) ? 1:0; // COMP2
            6: Dout <= D1 - D2; // SUB
            7: Dout <= (D1 < D2) ? 1:0; // COMP
            8: Dout <= (D1[31] < D2[31]) ? 1 : (D1[31] > D2[31]) ? 0: (D1[30:0] < D2[30:0]) ? 1:0; // COMPU
            9: Dout <= D1 << D2; // SHIFT LEFT
            10: Dout <= D1 >> D2; // SHIFT RIGHT
            11: Dout <= D1 >>> D2; // SHIFT RIGHT AND KEEP SIGN
            12: Dout <= ~(D1 | D2); // NOR
            16: Dout <= HI; // MFHI
            17: HI <= D1;   // MTHI
            18: Dout <= LO; // MFLO
            19: LO <= D1;   // MTLO
        endcase
        if (Dout == 0)
            ZERO <= 1;
        else
            ZERO <= 0;
    end
    
    always @(sel) begin
        case(sel)
            13: {HI, LO} <= D1 * D2; // MULT
            14: begin // DIV
                LO <= D1 / D2;
                HI <= D1 % D2;
            end
        endcase
    end
endmodule
