`timescale 1ns / 1ps

module dig_dec(
    din,
    a,
    b,
    c,
    d,
    e,
    f,
    g
    );
    input [3:0] din;
    output reg a = 0;
    output reg b = 0;
    output reg c = 0;
    output reg d = 0;
    output reg e = 0;
    output reg f = 0;
    output reg g = 0;
    
    always @(din) begin
        case(din)
            0: begin
                a = 1;
                b = 1;
                c = 1;
                d = 1;
                e = 1;
                f = 1;
                g = 0;
            end
            1: begin
                a = 0;
                b = 1;
                c = 1;
                d = 0;
                e = 0;
                f = 0;
                g = 0;
            end
            2: begin
                a = 1;
                b = 1;
                c = 0;
                d = 1;
                e = 1;
                f = 0;
                g = 1;
            end
            3: begin
                a = 1;
                b = 1;
                c = 1;
                d = 1;
                e = 0;
                f = 0;
                g = 1;
            end
            4: begin
                a = 0;
                b = 1;
                c = 1;
                d = 0;
                e = 0;
                f = 1;
                g = 1;
            end
            5: begin
                a = 1;
                b = 0;
                c = 1;
                d = 1;
                e = 0;
                f = 1;
                g = 1;
            end
            6: begin
                a = 1;
                b = 0;
                c = 1;
                d = 1;
                e = 1;
                f = 1;
                g = 1;
            end
            7: begin
                a = 1;
                b = 1;
                c = 1;
                d = 0;
                e = 0;
                f = 0;
                g = 0;
            end
            8: begin
                a = 1;
                b = 1;
                c = 1;
                d = 1;
                e = 1;
                f = 1;
                g = 1;
            end
            9: begin
                a = 1;
                b = 1;
                c = 1;
                d = 1;
                e = 0;
                f = 1;
                g = 1;
            end
            10: begin
                a = 1;
                b = 1;
                c = 1;
                d = 0;
                e = 1;
                f = 1;
                g = 1;
            end
            11: begin
                a = 0;
                b = 0;
                c = 1;
                d = 1;
                e = 1;
                f = 1;
                g = 1;
            end
            12: begin
                a = 1;
                b = 0;
                c = 0;
                d = 1;
                e = 1;
                f = 1;
                g = 0;
            end
            13: begin
                a = 0;
                b = 1;
                c = 1;
                d = 1;
                e = 1;
                f = 0;
                g = 1;
            end
            14: begin
                a = 1;
                b = 0;
                c = 0;
                d = 1;
                e = 1;
                f = 1;
                g = 1;
            end
            15: begin
                a = 1;
                b = 0;
                c = 0;
                d = 0;
                e = 1;
                f = 1;
                g = 1;
            end
            endcase
            a = !a;
            b = !b;
            c = !c;
            d = !d;
            e = !e;
            f = !f;
            g = !g;
    end
endmodule