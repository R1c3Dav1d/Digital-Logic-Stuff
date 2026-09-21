`timescale 1ns / 1ps
module tb_TFF();
 reg T, CLK, PRS_N, CLR_N;
 reg [3:0] V; // V is a 4-bit register: 3 2 1 0 are the 4 bit positions.
 wire Q, Q_N;

 TFF uut(T, CLK, PRS_N, CLR_N, Q, Q_N);
 // initialize inputs with an initial block.
 initial begin
 $display("Testbench start");
 $display("T C Pn Cn | Q Qn");
 {T, CLK, PRS_N, CLR_N, V} = 8'b00110000;
   end
 // always block runs to simulate inputs here.
 // Since inputs are set in the always block, each value set
 // must be declared as reg.
 always begin
 #10;
 $display("%d %d %d %d | %d %d", T, CLK, PRS_N, CLR_N, Q, Q_N);

 if (V == 4'b1111) begin //if block runs when V is 1111 (15 in dec)
 $display("Testbench end");
 $finish;
 end else begin //else block runs when V isn't 1111 (not 15 in dec)
 V = V + 1;
 case (V) //case block finds V value and runs the matching code.
 0: {T, CLK, PRS_N, CLR_N} = 4'b0011;
 1: {T, CLK, PRS_N, CLR_N} = 4'b0001;
 2: {T, CLK, PRS_N, CLR_N} = 4'b0011;
 3: {T, CLK, PRS_N, CLR_N} = 4'b0111;
 4: {T, CLK, PRS_N, CLR_N} = 4'b1011;
 5: {T, CLK, PRS_N, CLR_N} = 4'b1111;
 6: {T, CLK, PRS_N, CLR_N} = 4'b1011;
 7: {T, CLK, PRS_N, CLR_N} = 4'b1111;
 8: {T, CLK, PRS_N, CLR_N} = 4'b1011;
 9: {T, CLK, PRS_N, CLR_N} = 4'b1010;
 10: {T, CLK, PRS_N, CLR_N} = 4'b1011;
 11: {T, CLK, PRS_N, CLR_N} = 4'b0011;
 12: {T, CLK, PRS_N, CLR_N} = 4'b0111;
 13: {T, CLK, PRS_N, CLR_N} = 4'b0011;
 14: {T, CLK, PRS_N, CLR_N} = 4'b0111;
 15: {T, CLK, PRS_N, CLR_N} = 4'b0001;
 endcase
 end
 end
endmodule
