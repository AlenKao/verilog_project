`timescale 1ns / 1ps

module binary_multiplier(
    input [3:0] A, B,
    output [7:0] res
    );
    
    wire [3:0] s1, s2, s3;
    wire c1, c2, c3;
    assign res[0] = A[0] & B[0];
    binary_adder b0(.a({0, (A[3] & B[0]), (A[2] & B[0]), (A[1] & B[0])}), 
                    .b({(A[3] & B[1]), (A[2] & B[1]), (A[1] & B[1]), (A[0] & B[1])}),
                    .sum(s1), .c_out(c1));
    assign res[1] = s1[0];
    binary_adder b1(.a({c1, s1[3], s1[2], s1[1]}), 
                    .b({(A[3] & B[2]), (A[2] & B[2]), (A[1] & B[2]), (A[0] & B[2])}),
                    .sum(s2), .c_out(c2));  
    assign res[2] = s2[0];  
    binary_adder b2(.a({c2, s2[3], s2[2], s2[1]}), 
                    .b({(A[3] & B[3]), (A[2] & B[3]), (A[1] & B[3]), (A[0] & B[3])}),
                    .sum(s3), .c_out(c3));   
    assign res[6:3] = s3;
    assign res[7] = c3; 
endmodule