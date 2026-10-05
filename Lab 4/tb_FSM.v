`timescale 1ns / 1ps
module tb_SeqDet100();
 reg P, CLK, RESET_N;
 reg [5:0] V; // V is a 6-bit register: 5 4 3 2 1 0 are the 6 bit positions.
 wire Z;

 SeqDet100 uut(P, CLK, RESET_N, Z);
 // initialize inputs with an initial block.
 initial begin
 $display("Testbench start");
 $display("P C R | Z"); 
   {P, CLK, RESET_N, V} = 9'b001000000;
 end
 // always block runs to simulate inputs here.
 // Since inputs are set in the always block, each value set
 // must be declared as reg.
 always begin
 #10;
 $display("%d %d %d | %d", P, CLK, RESET_N, Z);

 if (V == 34) begin //if block runs when V is 100010 (34 in dec)
 $display("Testbench end");
 $finish;
 end else begin //else block runs when V isn't 100010 (not 34 in dec)
 V = V + 1; //Increment (increase the value of) V by 1.
 CLK = V[0]; // Clock is the LSB of V.
 case (V[5:1]) // These are the 5 most significant bits of V.
 0: {P, RESET_N} = 0;
 1: {P, RESET_N} = 2'b01;
 2: {P, RESET_N} = 2'b11;
 3: {P, RESET_N} = 2'b11;
 4: {P, RESET_N} = 2'b01;
 5: {P, RESET_N} = 2'b11;
 6: {P, RESET_N} = 2'b01;
 7: {P, RESET_N} = 2'b01;
 8: {P, RESET_N} = 2'b01;
 9: {P, RESET_N} = 2'b11;
 10: {P, RESET_N} = 2'b01;
 11: {P, RESET_N} = 2'b01;
 12: {P, RESET_N} = 2'b11;
 13: {P, RESET_N} = 2'b11;
 14: {P, RESET_N} = 2'b01;
 15: {P, RESET_N} = 2'b01;
 16: {P, RESET_N} = 2'b11;
 endcase
 end
 end
endmodule
