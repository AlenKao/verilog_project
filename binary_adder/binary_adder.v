`timescale 1ns / 1ps

module binary_adder(
    input [3:0] a, b,
    output [4:0] sum 
    );
    
    wire c1, c2, c3, c4;
    full_adder f1(.x(a[0]), .y(b[0]), .z(1'b0), .s(sum[0]), .c(c1));
    full_adder f2(.x(a[1]), .y(b[1]), .z(c1),   .s(sum[1]), .c(c2));
    full_adder f3(.x(a[2]), .y(b[2]), .z(c2),   .s(sum[2]), .c(c3));
    full_adder f4(.x(a[3]), .y(b[3]), .z(c3),   .s(sum[3]), .c(c4));
    assign sum[4] = c4;
endmodule

module full_adder(
    input x, y, z,
    output c, s
    );
    
    wire net1, net2, net3, net4, net5, net6;
    // s = x'y'z + x'yz' + xy'z' + xyz = z xor (x xor y)
    //assign s = (~x & ~y & z) | (~x & y & ~z) | (x & ~y & ~z) | (x & y & z);
    xor u0(net1, x, y);
    xor u1(s, net1, z);
    
    // c = xy + xz + yz
    //assign c = (x & y) | (x & z) | (y & z);
    and u2(net2, x, y);
    and u3(net3, x, z);
    and u4(net4, y, z);
    or  u5(net5, net2, net3);
    or  u6(c, net4, net5);
endmodule

