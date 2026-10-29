`timescale 1ns / 1ps

module illusion (EN, DATA, BOARDCLK, A, B, C, D, E, F, G, ONECOLD);
    // Sixteen bits (4 hex digits) to be displayed on the seven-segment displays.
    input [15:0] DATA;
    // The 100 MHz board clock and Enable button.
    input EN, BOARDCLK;
    // Sevens driver outputs.
    output A, B, C, D, E, F, G;
    // Only one output from ONECOLD should be 0. The rest should be 1.
    output [3:0] ONECOLD;

    // State variables for the Active Digit.
    wire Q1, Q0;
    
    // Inputs to the sevens_driver (4 bits split out from the multiplexer output).
    wire W3, W2, W1, W0;
    wire [3:0] HEX_OUT;
    
    // The generated scan-rate clock.
    wire FASTCLK;

    // First, generate a clock fast enough that you can't see the digits moving,
    // But slow enough that you can see each digit individually (~1 kHz).
    frequency_divider fd (
        .CLKO(BOARDCLK),
        .CLKF(FASTCLK)
    );

    // Next, keep state of which digit is active and control anodes.
    cold_fsm c_fsm (
        .CLK(FASTCLK),
        .EN(EN),
        .ONECOLD(ONECOLD),
        .STATE_OUT({Q1, Q0})
    );

    // A 4-bit 4-1 Multiplexer to select the correct nibble for the active display.
    mux_4bit_4to1 data_mux (
        .I3(DATA[15:12]),
        .I2(DATA[11:8]),
        .I1(DATA[7:4]),
        .I0(DATA[3:0]),
        .S({Q1, Q0}),
        .Y(HEX_OUT)
    );

    // Break the 4-bit bus (HEX_OUT) into individual wires (W3, W2, W1, W0) 
    // to match your sevens_driver module port signature.
    assign {W3, W2, W1, W0} = HEX_OUT;

    // Finally, the sevens driver instantiated with individual bit inputs.
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
