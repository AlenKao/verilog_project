`timescale 1ns / 1ps

module dec_adder_tb;
    reg [3:0] A0, A1;
    reg [3:0] B0, B1;
    wire [3:0] S0, S1;
    wire cout;
    initial begin
        A1 = 0;
        A0 = 3;
        B1 = 0;
        B0 = 5;
        #25
        
        A1 = 0;
        A0 = 6;
        B1 = 0;
        B0 = 5;
        #25
        
        A1 = 2;
        A0 = 4;
        B1 = 2;
        B0 = 6;
        #25
        
        A1 = 4;
        A0 = 9;
        B1 = 5;
        B0 = 1;
        #25 $finish;
    end
    dec_adder u_dec_adder(.A0(A0), .A1(A1), .B0(B0), .B1(B1), .s0(S0), .s1(S1), .c_out(cout));
endmodule
