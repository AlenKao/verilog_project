`timescale 1ns / 1ps

module binary_adder(
    input [3:0] num1,
    input [3:0] num2,
    input c_in,
    output [3:0] sum,
    output c_out);

    wire c1, c2, c3;
   
    full_adder u1(num1[0], num2[0], c_in, sum[0], c1);
    full_adder u2(num1[1], num2[1], c1, sum[1], c2);
    full_adder u3(num1[2], num2[2], c2, sum[2], c3);
    full_adder u4(num1[3], num2[3], c3, sum[3], c_out);
    
endmodule

module full_adder(
    input a,
    input b,
    input c_in,
    output s,
    output c_out);
    
    wire net1, net2, net3;
    
    xor (net1, a, b);
    and (net2, a, b);
    xor (s, net1, c_in);
    and (net3, net1, c_in);
    xor (c_out, net2, net3);
    
endmodule