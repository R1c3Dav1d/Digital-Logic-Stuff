
`timescale 1ns / 1ps

module ctr_4bsdp(
    input EN,
    input CLK,
    input RESET_N,
    output W3, W2, W1, W0
);

    wire t3_en, t2_en, t1_en, t0_en;

    assign t0_en = EN;
    assign t1_en = EN & ~W0;
    assign t2_en = EN & ~W0 & ~W1;
    assign t3_en = EN & ~W0 & ~W1 & ~W2;

    TFF tff0(
        .T(t0_en),
        .CLK(CLK),
        .PRS_N(RESET_N),
        .CLR_N(1'b1),
        .Q(W0),
        .Q_N()
    );

    TFF tff1(
        .T(t1_en),
        .CLK(CLK),
        .PRS_N(RESET_N),
        .CLR_N(1'b1),
        .Q(W1),
        .Q_N()
    );

    TFF tff2(
        .T(t2_en),
        .CLK(CLK),
        .PRS_N(RESET_N),
        .CLR_N(1'b1),
        .Q(W2),
        .Q_N()
    );

    TFF tff3(
        .T(t3_en),
        .CLK(CLK),
        .PRS_N(RESET_N),
        .CLR_N(1'b1),
        .Q(W3),
        .Q_N()
    );

endmodule
