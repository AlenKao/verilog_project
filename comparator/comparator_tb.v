`timescale 1ns / 1ps

module comparator_tb;
    reg [3:0] a, b;
    wire eq, lr, ls;
    initial begin
        a = 4'b0010;
        b = 4'b0010;
        #25
        a = 4'b1000;
        b = 4'b0001;
        #25
        a = 4'b0000;
        b = 4'b0100;
        #25 $finish;    
    end
    comparator u_comparator(.A(a), .B(b), .equal(eq), .bigger(lr), .less(ls));
endmodule
