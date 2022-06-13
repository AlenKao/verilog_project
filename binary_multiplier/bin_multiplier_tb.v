`timescale 1ns / 1ps

module bin_multiplier_tb;
    reg [3:0] a, b;
    wire [7:0] res;
    initial begin
        a = 15;
        b = 10;
        #25
        
        a = 10;
        b = 10;
        #25
        
        a = 15;
        b = 15;
        #25 $finish;
    end
    
    binary_multiplier mul(.A(a), .B(b), .res(res));
endmodule
