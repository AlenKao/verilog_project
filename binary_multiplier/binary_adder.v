`timescale 1ns / 1ps

module binary_adder(
    input [3:0] a, b,
    output [3:0] sum,
    output c_out
    );
    
    wire c1, c2, c3, c4;
    full_adder f1(.x(a[0]), .y(b[0]), .z(1'b0), .s(sum[0]), .c(c1));
    full_adder f2(.x(a[1]), .y(b[1]), .z(c1), .s(sum[1]), .c(c2));
    full_adder f3(.x(a[2]), .y(b[2]), .z(c2), .s(sum[2]), .c(c3));
    full_adder f4(.x(a[3]), .y(b[3]), .z(c3), .s(sum[3]), .c(c4));
    assign c_out = c4;
endmodule