
`timescale 1ns / 1ps

module countdown (
    input CLK,
    input EN,
    input RESET_N,
    output A, B, C, D, E, F, G
);

    wire clk_div;
    wire w3, w2, w1, w0;

    frequency_divider frequency_divider (
        .CLKO(CLK),
        .CLKF(clk_div)
    );

    ctr_4bsdp ctr_4bsdp (
        .EN(EN),
        .CLK(clk_div),
        .RESET_N(RESET_N),
        .W3(w3),
        .W2(w2),
        .W1(w1),
        .W0(w0)
    );

    sevens_driver sevens_driver (
        .W3(w3),
        .W2(w2),
        .W1(w1),
        .W0(w0),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .F(F),
        .G(G)
    );

endmodule
