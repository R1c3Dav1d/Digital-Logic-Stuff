
`timescale 1ns / 1ps

module illusion (
    input EN,
    input [15:0] DATA,
    input BOARDCLK,
    output A, B, C, D, E, F, G,
    output [3:0] ONECOLD
);

    // FSM state variables
    wire Q1, Q0;

    // Multiplexer output
    wire [3:0] HEX_OUT;

    // Seven-segment driver inputs
    wire W3, W2, W1, W0;

    // Divided clock
    wire FASTCLK;

    // 1. Frequency divider
    frequency_divider fd (
        .CLKO(BOARDCLK),
        .CLKF(FASTCLK)
    );

    // 2. One-cold finite state machine
    cold_fsm c_fsm (
        .CLK(FASTCLK),
        .EN(EN),
        .ONECOLD(ONECOLD),
        .STATE_OUT({Q1, Q0})
    );

    // 3. Four-to-one, 4-bit multiplexer
    mux_4bit_4to1 data_mux (
        .I0(DATA[15:12]),
        .I1(DATA[11:8]),
        .I2(DATA[7:4]),
        .I3(DATA[3:0]),
        .S({Q1, Q0}),
        .Y(HEX_OUT)
    );

    // 4. Split multiplexer output into bits
    assign {W3, W2, W1, W0} = HEX_OUT;

    // 5. Seven-segment decoder
    sevens_driver s_driver (
        .W3(W3),
        .W2(W2),
        .W1(W1),
        .W0(W0),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .F(F),
        .G(G)
    );

endmodule
