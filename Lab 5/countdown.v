`timescale 1ns / 1ps

module countdown (
  input CLK,
  input EN,
  input RESET_N,
  output [6:0] SEG //seven segment signals A->G
);

  wire clk_div;
  wire w3, w2, w1, w0;

  frequency_divider frequency_divider (
    .CLK0(CLK),
    .CLKF(clk_div)
  );

  ctr_4bdsp ctr_4bsdp (
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
    .A(SEG[0]),
    .B(SEG[1]),
    .C(SEG[2]),
    .D(SEG[3]),
    .E(SEG[4]), 
    .F(SEG[5]),
    .G(SEG[6])
  );

endmodule
