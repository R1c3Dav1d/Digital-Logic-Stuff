`timescale 1ns / 1ps
// Note that we can do this without using procedural code
// However, we will be using procedural code to become more familiar with it
module mux21(S, A, B, F);
 input S, A, B;
 // Notice that F is declared as both an output (since it is the result)
 // and as a reg (because its value is set when in the always block.
 output reg F;

 // S or A or B lists the items in this always block's sensitivity list
 // This means that the always block runs when any input in the
 // sensitivity list changes.
 // Note that you can just write "*" in lieu of "S or A or B" and (no quotes)
 // all of the inputs will be used in the sensitivity list.
 always @(S or A or B) begin

 // This is an if block: the line F = A is inside the if block, meaning
 // that if S is equal to 0, then F will take the value of A.
 // Remember how a 2-1 mux works: if S is 0, then F = A, and if S is 1, then F = B.
 if (S == 0) begin

 // Reflects what should happen when S is equal to 0.
 F = A;

 // The else block: if the preceding condition (S == 0) is false, then the
 // else block will run.
 // This else is followed by another if, which checks to see if S is equal to 1.
 // the end at the beginning of the line closes the if (S==0)
 end else if (S == 1) begin

 // Reflects what should happen when S is equal to 1.
 F = B;
 end
 end

endmodule
