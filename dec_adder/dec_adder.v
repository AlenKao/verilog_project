`timescale 1ns / 1ps

module dec_adder(
    input [3:0] A1, A0,
    input [3:0] B1, B0,
    output [3:0] s1, s0,
    output c_out);
    
    wire c0;

	bcd_adder adder0(A0, B0, 1'b0, s0, c0);
	bcd_adder adder1(A1, B1, c0, s1, c_out);
endmodule
