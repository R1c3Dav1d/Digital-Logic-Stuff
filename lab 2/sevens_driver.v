`timescale 1ns / 1ps

module sevens_driver(W3, W2, W1, W0, A, B, C, D, E, F, G);
    input W3, W2, W1, W0;
    output A, B, C, D, E, F, G;

    // Remember that a logic 1 at the seven-segment display turns the light off
    // so, to turn the light on, you provide a logic 0.

    wire [3:0] fourbit_input;
    reg [6:0] sevenbit_output;

    // Notice that fourbit_input is 4-bits and each bit is assigned
    // using the following concatenation operation to the four bits of W.
    assign fourbit_input = {W3, W2, W1, W0};

    // The same is also done of the 7-bit reg sevenbit_output, which takes
    // the 7-bits of the reg and connects them to the seven outputs A thru G.
    assign {A, B, C, D, E, F, G} = sevenbit_output;

    always @(*) begin
        // Here, we have the case statement, which looks at the 4-bit input as a value
        // then runs the code that matches with that value.
        case (fourbit_input)
            // Bit order in sevenbit_output corresponds to {A, B, C, D, E, F, G}
            0:  sevenbit_output = 7'b0000001; // 0: A,B,C,D,E,F on
            1:  sevenbit_output = 7'b1001111; // 1: B,C on
            2:  sevenbit_output = 7'b0010010; // 2: A,B,D,E,G on
            3:  sevenbit_output = 7'b0000110; // 3: A,B,C,D,G on
            4:  sevenbit_output = 7'b1001100; // 4: B,C,F,G on
            5:  sevenbit_output = 7'b0100100; // 5: A,C,D,F,G on
            6:  sevenbit_output = 7'b0100000; // 6: A,C,D,E,F,G on
            7:  sevenbit_output = 7'b0001111; // 7: A,B,C on
            8:  sevenbit_output = 7'b0000000; // 8: All segments on
            9:  sevenbit_output = 7'b0000100; // 9: A,B,C,D,F,G on
            10: sevenbit_output = 7'b0001000; // A: A,B,C,E,F,G on
            11: sevenbit_output = 7'b1100000; // b: C,D,E,F,G on (lowercase)
            12: sevenbit_output = 7'b0110001; // C: A,D,E,F on
            13: sevenbit_output = 7'b1000010; // d: B,C,D,E,G on (lowercase)
            14: sevenbit_output = 7'b0110000; // E: A,D,E,F,G on
            15: sevenbit_output = 7'b0111000; // F: A,E,F,G on
            default: sevenbit_output = 7'b1111111; // All segments off
        endcase
    end
endmodule
