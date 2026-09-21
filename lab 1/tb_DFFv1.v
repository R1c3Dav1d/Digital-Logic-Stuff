`timescale 1ns / 1ps
module tb_DFFv1();
 reg D, CLK;
 reg [3:0] V; // V is a 4-bit register: 3 2 1 0 are the 4 bit positions.
 wire Q;

 DFFv1 uut(D, CLK, Q);
 // initialize inputs with an initial block.
 initial begin
 $display("Testbench start");
 $display("D C | Q");
 {D, CLK, V} = 6'b000000;
 // This sets D, CLK, and the 4-bit register V to all zeros.
 // D and CLK are both 1-bit, bringing the total number of bits to 6.
 end
 // always block runs to simulate inputs here.
 // Since inputs are set in the always block, each value set
 // must be declared as reg.
 always begin
 #10;
 $display("%d %d | %d", D, CLK, Q);

 if (V == 4'b1111) begin //if block runs when V is 1111 (15 in dec)
 $display("Testbench end");
 $finish;
 end else begin //else block runs when V isn’t 1111 (not 15 in dec)
 V = V + 1;
 case (V) //case block finds V value and runs the matching code.
 0: {D, CLK} = 2'b00;
 1: {D, CLK} = 2'b01;
 2: {D, CLK} = 2'b10;
 3: {D, CLK} = 2'b11;
 4: {D, CLK} = 2'b01;
 5: {D, CLK} = 2'b11;
 6: {D, CLK} = 2'b10;
 7: {D, CLK} = 2'b11;
 8: {D, CLK} = 2'b01;
 9: {D, CLK} = 2'b00;
 10: {D, CLK} = 2'b01;
 11: {D, CLK} = 2'b00;
 12: {D, CLK} = 2'b10;
 13: {D, CLK} = 2'b11;
 14: {D, CLK} = 2'b00;
 15: {D, CLK} = 2'b01;
 endcase
 end
 end
endmodule
