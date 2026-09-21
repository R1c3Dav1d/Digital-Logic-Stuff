`timescale 1ns / 1ps
/* After running the simulation, if you do not see "Testbench
 Complete" on the console, then increase simulation time to
 Say 10000 ns */
module tb_mux21();
 reg S, A, B;
 wire F;
 reg [3:0] ctr;
 mux21 uut(S, A, B, F);
 // The initial block runs procedural code before anything else runs.
 initial begin
 $display("Testbench start");
 $display("S A B | F");
{S, A, B, ctr} = 7'b0000000;
 end
 // The always block executes procedural (line-by-line) code.
 always begin
 #10;
 $display("%d %d %d | %d", S, A, B, F);

 case (ctr)
 0: {S, A, B, ctr} = 7'b0100001;
 1: {S, A, B, ctr} = 7'b0010010;
 2: {S, A, B, ctr} = 7'b0100011;
 3: {S, A, B, ctr} = 7'b0010100;
 4: {S, A, B, ctr} = 7'b0100101;
 5: {S, A, B, ctr} = 7'b0010110;
 6: {S, A, B, ctr} = 7'b0110111;
 7: {S, A, B, ctr} = 7'b1111000;
 8: {S, A, B, ctr} = 7'b1101001;
 9: {S, A, B, ctr} = 7'b1011010;
 10: {S, A, B, ctr} = 7'b1101011;
 11: {S, A, B, ctr} = 7'b1011100;
 12: {S, A, B, ctr} = 7'b1101101;
 13: {S, A, B, ctr} = 7'b1011110;
 14: begin
 $display("Testbench end");
 $finish;
 end
 endcase
 end
endmodule
