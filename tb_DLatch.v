`timescale 1ns / 1ps
/* After running the simulation, if you do not see "Testbench
 Complete" on the console, then increase simulation time to
 Say 10000 ns */
module tb_DLatch();
 reg D, EN;
 wire Q, Q_N;
 reg [4:0] ctr;
 DLatch uut(D, EN, Q, Q_N);
 // The initial block runs procedural code before anything else runs.
 initial begin
 $display("Testbench start");
 $display("D EN|Q Qn");
 {ctr, D, EN} = 7'b000000;
 end
 // The always block executes procedural (line-by-line) code.
 always begin
 #10;
 $display("%d %d |%d %d", D, EN, Q, Q_N);

 case (ctr)
 0: {ctr, D, EN} = 7'b0000110;
 1: {ctr, D, EN} = 7'b0001000;
 2: {ctr, D, EN} = 7'b0001101;
 3: {ctr, D, EN} = 7'b0010011;
 4: {ctr, D, EN} = 7'b0010101;
 5: {ctr, D, EN} = 7'b0011011;
 6: {ctr, D, EN} = 7'b0011111;
 7: {ctr, D, EN} = 7'b0100010;
 8: {ctr, D, EN} = 7'b0100100;
 9: {ctr, D, EN} = 7'b0101010;
 10: {ctr, D, EN} = 7'b0101100;
 11: {ctr, D, EN} = 7'b0110000;
 12: {ctr, D, EN} = 7'b0110101;
 13: {ctr, D, EN} = 7'b0111011;
 14: {ctr, D, EN} = 7'b0111111;
 15: {ctr, D, EN} = 7'b1000011;
 16: {ctr, D, EN} = 7'b1000101;
 17: {ctr, D, EN} = 7'b1001000;
 18: {ctr, D, EN} = 7'b1001110;
 19: {ctr, D, EN} = 7'b1010011;
 20: {ctr, D, EN} = 7'b1010111;
 21: begin
 $display("Testbench end");
 $finish;
 end
 endcase
 end
endmodule