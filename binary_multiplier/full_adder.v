`timescale 1ns / 1ps

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
