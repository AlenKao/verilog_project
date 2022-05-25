`timescale 1ns / 1ps

module exceed3_tb;
    reg A, B, C, D;
    wire w, x, y, z;
    
    initial begin
        A = 1'b0;
        B = 1'b0;
        C = 1'b0;
        D = 1'b0;
        #30
        A = 1'b0;
        B = 1'b0;
        C = 1'b0;
        D = 1'b1;
        #30     
        A = 1'b0;
        B = 1'b0;
        C = 1'b1;
        D = 1'b0;
        #30
        A = 1'b0;
        B = 1'b0;
        C = 1'b1;
        D = 1'b1;
        #30   
        A = 1'b0;
        B = 1'b1;
        C = 1'b0;
        D = 1'b0;
        #30 
        A = 1'b0;
        B = 1'b1;
        C = 1'b0;
        D = 1'b1;
        #30 
        A = 1'b0;
        B = 1'b1;
        C = 1'b1;
        D = 1'b0;
        #30
        A = 1'b0;
        B = 1'b1;
        C = 1'b1;
        D = 1'b1;
        #30
        A = 1'b1;
        B = 1'b0;
        C = 1'b0;
        D = 1'b0;
        #30  
        A = 1'b1;
        B = 1'b0;
        C = 1'b0;
        D = 1'b1;
        #30 $finish;
    end  
    exceed3 u_exceed3(.A(A), .B(B), .C(C), .D(D), .w(w), .x(x), .y(y), .z(z));                                                       
endmodule