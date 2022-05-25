`timescale 1ns / 1ps

module binary_adder_lookahead(
    input cin,
    input [3:0] A, B,
    output [4:0] S
    );
    
    wire [3:0] P, G;
    wire [4:0] C;
    assign S[0] = P[0] ^ C[0];
    assign S[1] = P[1] ^ C[1];
    assign S[2] = P[2] ^ C[2];
    assign S[3] = P[3] ^ C[3];
    assign S[4] = C[4];
    
    wire n0, n1, n2, n3;
    // C0 = 0
    assign C[0] = cin;
    
    // C1
    and u0(n0, P[0], C[0]);
    or  u1(C[1], G[0], n0);
    
    // C2
    and u2(n1, P[1], C[1]);
    or  u3(C[2] , G[1], n1);
    
    // C3
    and u4(n2, P[2], C[2]);
    or  u5(C[3], G[2], n2);
    
    // C4
    and u6(n3, P[3], C[3]);
    or  u7(C[4], G[3], n3);
    
    lookahead_logic u_lookahead_logic(.A(A), .B(B), .P(P), .G(G));
endmodule
