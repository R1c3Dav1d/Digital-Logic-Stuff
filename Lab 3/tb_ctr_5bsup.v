`timescale 1ns / 1ps
module tb_ctr_5bsup();
 reg CLK, RESET_N;
 reg [5:0] V; // V is a 6-bit register: 5 4 3 2 1 0 are the 6 bit positions.
 wire A, B, C, D, E;

 ctr_5bsup uut(CLK, RESET_N, A, B, C, D, E);
 // initialize inputs with an initial block.
 initial begin
 $display("Testbench start");
 $display("C R | Out");
 {CLK, RESET_N, V} = 8'b01000000;
 end
 // always block runs to simulate inputs here.
 // Since inputs are set in the always block, each value set
 // must be declared as reg.
 always begin
   #10;
 $display("%d %d | %d", CLK, RESET_N, {E, D, C, B, A});

 if (V == 63) begin //if block runs when V is 111111 (63 in dec)
 $display("Testbench end");
 $finish;
 end else begin //else block runs when V isn't 111111 (not 63 in dec)
 V = V + 1; //Increment (increase the value of) V by 1.
 CLK = V[0]; // Clock is the LSB of V.
 if (V == 4)
 RESET_N = 0; // Reset will be 0 specifically when V is 4.
 else
 RESET_N = 1;
 end
 end
endmodule
