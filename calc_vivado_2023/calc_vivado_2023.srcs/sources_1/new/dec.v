`timescale 1ns / 1ps

module dec(
    ain,
    aout
    );
    input [1:0] ain;
    output reg [3:0] aout;
    
    always @(ain) begin
        aout[0] = 1;
        aout[1] = 1;
        aout[2] = 1;
        aout[3] = 1;
        aout[ain] = 0;
    end
    
endmodule
