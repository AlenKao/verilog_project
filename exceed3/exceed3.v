`timescale 1ns / 1ps

module exceed3(
    input A, B, C, D,
    output w, x, y, z
    );
    
    //  w = A + BC + BD
    assign w = A | (B & C) | (B & D);
    
    // x = B'C + B'D + BC'D'
    assign x = (~B & C) | (~B & D) | (B & ~C & ~D);
    
    // y = CD + C'D'
    assign y = (C & D) | (~C & ~D);
    
    // z = D'
    and u0(z, ~D, 1);
endmodule