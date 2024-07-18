`timescale 1ns / 1ps

module dig_dec_top(
    xin,
    clk,
    a,
    b,
    c,
    d,
    e,
    f,
    g,
    A
    );
    input [15:0] xin;
    input clk;
    output a;
    output  b;
    output  c;
    output  d;
    output  e;
    output  f;
    output  g;
    output  [3:0] A;
    
    wire [1:0] sel;
    wire [3:0] nr;
    wire [3:0] sel_led;
    assign nr = (sel == 0) ? xin[3:0]: (sel == 1) ? xin[7:4] : (sel == 2) ? xin[11:8] : xin[15:12];
    
    cnt cnt_1(.clk(clk), .n(sel));
    
    dig_dec dig_dec_1(
        .din(nr),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g));
        
    dec dec_1(.ain(sel), .aout(A));
    dec dec_2(.ain(sel), .aout(sel_led));
endmodule

