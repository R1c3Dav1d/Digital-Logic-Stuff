`timescale 1ns / 1ps

module reg4b (L, N, CLK, PRS_N, CLR_N, Q);
    input L, CLK, PRS_N, CLR_N;
    input [3:0] N;
    output [3:0] Q;

    // Instantiate four 1-bit registers for the 4-bit bus
    register bit3 (.L(L), .N(N[3]), .CLK(CLK), .PRS_N(PRS_N), .CLR_N(CLR_N), .Q(Q[3]));
    register bit2 (.L(L), .N(N[2]), .CLK(CLK), .PRS_N(PRS_N), .CLR_N(CLR_N), .Q(Q[2]));
    register bit1 (.L(L), .N(N[1]), .CLK(CLK), .PRS_N(PRS_N), .CLR_N(CLR_N), .Q(Q[1]));
    register bit0 (.L(L), .N(N[0]), .CLK(CLK), .PRS_N(PRS_N), .CLR_N(CLR_N), .Q(Q[0]));

endmodule
