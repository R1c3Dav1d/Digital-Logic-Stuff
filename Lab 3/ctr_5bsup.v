`timescale 1ns / 1ps
module ctr_5bsup(
    input CLK,
    input RESET_N,
    output A, // LSB (Bit 0)
    output B, // Bit 1
    output C, // Bit 2
    output D, // Bit 3
    output E  // MSB (Bit 4)
);

    // Bit 0 (LSB): Toggles every clock edge
    TFF tff0 (
        .T(1'b1),
        .CLK(CLK),
        .PRS_N(1'b1),
        .CLR_N(RESET_N),
        .Q(A),
        .Q_N()
    );

    // Bit 1: Toggles when A = 1
    TFF tff1 (
        .T(A),
        .CLK(CLK),
        .PRS_N(1'b1),
        .CLR_N(RESET_N),
        .Q(B),
        .Q_N()
    );

    // Bit 2: Toggles when A & B = 1
    TFF tff2 (
        .T(A & B),
        .CLK(CLK),
        .PRS_N(1'b1),
        .CLR_N(RESET_N),
        .Q(C),
        .Q_N()
    );

    // Bit 3: Toggles when A & B & C = 1
    TFF tff3 (
        .T(A & B & C),
        .CLK(CLK),
        .PRS_N(1'b1),
        .CLR_N(RESET_N),
        .Q(D),
        .Q_N()
    );

    // Bit 4 (MSB): Toggles when A & B & C & D = 1
    TFF tff4 (
        .T(A & B & C & D),
        .CLK(CLK),
        .PRS_N(1'b1),
        .CLR_N(RESET_N),
        .Q(E),
        .Q_N()
    );

endmodule
