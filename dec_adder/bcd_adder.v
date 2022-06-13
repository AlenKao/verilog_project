`timescale 1ns / 1ps

module bcd_adder(
    input [3:0] num1,
    input [3:0] num2,
    input c_in,
    output [3:0] sum,
    output c_out);
    
	wire [3:0] z;
	wire k, temp;
	binary_adder adder1(num1, num2, c_in, z, k);
	
    wire w0, w1, w2;
    and(w0, z[3], z[2]);
    and(w1, z[3], z[1]);
    or(w2, w0, w1);
    or(c_out, w2, k);

	binary_adder adder2(z, {1'b0, c_out, c_out, 1'b0}, 1'b0, sum, temp);
 
endmodule
