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
    input [3:0] sel;
    output reg ZERO;
    output reg [31:0] Dout;
    
    always @(*) begin
        case(sel)
            0: Dout <= D1 & D2;
            1: Dout <= D1 | D2;
            2: Dout <= D1 + D2;
            6: Dout <= D1 - D2;
            7: Dout <= (D1 < D2) ? 1:0;
            8: Dout <= (D1[31] < D2[31]) ? 1 : (D1[31] > D2[31]) ? 0: (D1[30:0] < D2[30:0]) ? 1:0;
            9: Dout <= D1 << D2;
            10: Dout <= D1 >> D2;
            12: Dout <= ~(D1 | D2);
        endcase
        if (Dout == 0)
            ZERO <= 1;
        else
            ZERO <= 0;
    end
    
endmodule
