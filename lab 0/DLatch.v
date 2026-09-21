`timescale 1ns / 1ps
module DLatch(D, EN, Q, Q_N);
// The parenthesis above should have all names for the ports
// The ports, of course, being the inputs and outputs.
// Each port's "direction" is declared on the next line.
 input D, EN;
 output Q, Q_N;

// Connections that are not ports are declared as wires
// Except in procedural code, where they are declared as regs.
 wire A, B;
// Observe the use of assign to set the value of wires.
// Rather than in C, where the value is calculated sequentially
// Each line sets up logic gates to perform the expression.
 assign #1 A = ~(D & EN);
 assign #1 B = ~(~D & EN);

// The value assigned would be calculated when one of the terms changes
// Just like how it would be if it were an actual gate.
// The #1 adds one time-unit delay between the input change and the output.
 assign #1 Q = ~(A & Q_N);
 assign #1 Q_N = ~(B & Q);
// It also means that
// the order in which these assign statements doesn't matter.
// Moving the assignment to A would still allow this to compile.
endmodule
