`timescale 1ns / 1ps

module comparator(
    input [3:0] A, B,
    output equal, bigger, less
    );
    wire [3:0] X;
    x x0(.a(A), .b(B), .x(X));
    
    // (A = B) = x3x2x1x0
    // assign o[0] = X[3] & X[2] & X[1] & X[0];
    wire net0, net1;
    and u0(net0, X[3], X[2]);
    and u1(net1, net0, X[1]);
    and u2(equal, net1, X[0]);
    
    // (A > B) = A3B3' + x3A2B2' + x3x2A1B1' + x3x2x1A0B0'
    // assign o[1] = (A[3]&~B[3]) | (X[3]&A[2]&~B[2]) | (X[3]&X[2]&A[1]&~B[1]) | (X[3]&X[2]&X[1]&A[0]&~B[0]);
    wire net2, net3, net4, net5, net6, net7, net8, net9, net10, net11, net12, net13;
    and u3(net2, A[3], ~B[3]);
    
    and u4(net3, X[3], A[2]);
    and u5(net4, net3, ~B[2]);
    
    and u6(net5, X[3], X[2]);
    and u7(net6, A[1], ~B[1]);
    and u8(net7, net5, net6);
    
    and u9(net8, X[3], X[2]);
    and u10(net9, net8, X[1]);
    and u11(net10, A[0], ~B[0]);
    and u12(net11, net9, net10);
    
    or  u13(net12, net2, net4);
    or  u14(net13, net7, net11);
    or  u15(bigger, net12, net13);
    // (A < B) = A3'B3 + x3A2'B2 + x3x2A1'B1 + x3x2x1A0'B0
    //assign o[2] = (~A[3]&B[3]) | (X[3]&~A[2]&B[2]) | (X[3]&X[2]&~A[1]&B[1]) | (X[3]&X[2]&X[1]&~A[0]&B[0]);  
    wire net14, net15, net16, net17, net18, net19, net20, net21, net22, net23, net24, net25;
    and u16(net14, ~A[3], B[3]);
    
    and u17(net15, X[3], ~A[2]);
    and u18(net16, net15, B[2]);
    
    and u19(net17, X[3], X[2]);
    and u20(net18, ~A[1], B[1]);
    and u21(net19, net17, net18);
    
    and u22(net20, X[3], X[2]);
    and u23(net21, net20, X[1]);
    and u24(net22, ~A[0], B[0]);
    and u25(net23, net21, net22);
    
    or  u26(net24, net14, net16);
    or  u27(net25, net19, net23);
    or  u28(less, net24, net25);  
endmodule

module x(
    input [3:0] a, b,
    output [3:0] x
    );
    assign x[0] = (a[0] & b[0]) | (~a[0] & ~b[0]);
    assign x[1] = (a[1] & b[1]) | (~a[1] & ~b[1]);
    assign x[2] = (a[2] & b[2]) | (~a[2] & ~b[2]);
    assign x[3] = (a[3] & b[3]) | (~a[3] & ~b[3]);
endmodule
