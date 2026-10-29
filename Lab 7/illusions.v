`timescale 1ns / 1ps

module illusion (EN, DATA, BOARDCLK, A, B, C, D, E, F, G, ONECOLD);
    // Sixteen bits (4 hex digits) to be displayed on the seven-segment displays.
    input [15:0] DATA;
    // The 100 MHz board clock.
    input EN, BOARDCLK;
    // Sevens driver outputs.
    output A, B, C, D, E, F, G;
    // Only one output from ONECOLD should be 0. The rest should be 1.
    output [3:0] ONECOLD;

    // State variables for the Active Digit.
    wire Q1, Q0;
    
    // Inputs to the sevens_driver at the end (4-bit Hex value for the current digit).
    wire [3:0] HEX_OUT;
    
    // The generated scan-rate clock.
    wire FASTCLK;

    // First, generate a clock fast enough that you can't see the digits moving,
    // But slow enough that you can see each digit individually (e.g., ~1 kHz).
    frequency_divider fd (
        .BOARDCLK(BOARDCLK),
        .EN(EN),                // Often useful to have an enable for the divider
        .FASTCLK(FASTCLK)
    );

    // Next, keep state of which digit is active and control anodes.
    // cold_fsm generates one cold wire for the active display based on EN and FASTCLK.
    // It also outputs its state variables Q1 and Q0.
    cold_fsm c_fsm (
        .CLK(FASTCLK),
        .EN(EN),
        .ONECOLD(ONECOLD),
        .STATE_OUT({Q1, Q0})  // Output current state for mux control
    );

    // A 4-bit 4-1 Multiplexer to select the correct nibble for the active display.
    // Select lines {Q1, Q0} connect each 4-bit segment of DATA to HEX_OUT.
    // (e.g., Q={1,1} selects DATA[15:12], Q={0,0} selects DATA[3:0]).
    mux_4bit_4to1 data_mux (
        .I3(DATA[15:12]),       // Mux input 3
        .I2(DATA[11:8]),        // Mux input 2
        .I1(DATA[7:4]),         // Mux input 1
        .I0(DATA[3:0]),         // Mux input 0
        .S({Q1, Q0}),           // Select lines from FSM state
        .Y(HEX_OUT)             // 4-bit output to the sevens driver
    );

    // Finally, the sevens driver which displays the active digit's value.
    // It decodes the 4-bit hex value to 7-segment patterns (active high for a-g).
    sevens_driver s_driver (
        .EN(EN),
        .HEX(HEX_OUT),
        .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G)
    );

endmodule
