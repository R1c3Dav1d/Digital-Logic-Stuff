`timescale 1ns / 1ps
module SeqDet100 (
    input P,
    input CLK,
    input RESET_N,
    output Z
);

    // Normal and inverted outputs of the DFFs
    wire Q1, QN1, Q0, QN0;

    // Next-state logic outputs
    wire D1, D0;

    // Next State Logic expressions
    assign D1 = (Q1 ^ Q0) & (~P);
    assign D0 = P | (Q1 & ~Q0 & ~p);

    // Output logic expression (Moore machine relies only on current state)
    assign Z = Q1 & Q0;

    // Flip-Flop Instances
    DFF dff1 (
        .D(D1),
        .CLK(CLK),
        .PRS_N(1'b1),
        .CLR_N(RESET_N),
        .Q(Q1),
        .Q_N(QN1)
    );

    DFF dff0 (
        .D(D0),
        .CLK(CLK),
        .PRS_N(1'b1),
        .CLR_N(RESET_N),
        .Q(Q0),
        .Q_N(QN0)
    );

endmodule
