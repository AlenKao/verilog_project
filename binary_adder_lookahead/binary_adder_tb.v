`timescale 1ns / 1ps

module binary_adder_tb;
    reg cin;
    reg [3:0] A, B;
    wire [4:0] S;
    initial begin
        cin = 0;
        A = 4'b0001;
        B = 4'b0001;
        #25
        
        cin = 0;
        A = 4'b0010;
        B = 4'b0010;
        #25
        
        cin = 0;
        A = 4'b0100;
        B = 4'b0100;
        #25
        
        cin = 0;
        A = 4'b1001;
        B = 4'b1001;
        #25 $finish;
    end
    binary_adder_lookahead u_binary_adder_lookahead(.cin(cin), .A(A), .B(B), .S(S));
endmodule
