`timescale 1ns / 1ps

module binary_adder_tb;
    reg [3:0] a, b;
    wire [4:0] sum;
    initial begin
        a = 4'b0000;
        b = 4'b0000;
        #25
        a = 4'b0001;
        b = 4'b0001;
        #25        
        a = 4'b0010;
        b = 4'b0010;
        #25   
        a = 4'b0100;
        b = 4'b0100;
        #25 
        a = 4'b1001;
        b = 4'b1001;
        #25 $finish;               
    end
    binary_adder u_binary_adder(.a(a), .b(b), .sum(sum));
endmodule
