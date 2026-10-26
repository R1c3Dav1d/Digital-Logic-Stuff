`timescale 1ns / 1ps
module tb_regfile_8_4b();
 reg WADDR2, WADDR1, WADDR0, WEN, CLK, XRADDR2, XRADDR1, XRADDR0, YRADDR2, YRADDR1, YRADDR0;
 reg [3:0] DATA_IN; // This is a 4-bit register used for input.
 wire [3:0] DATA_X, DATA_Y; // This is a 4-bit output bus.

 reg [4:0] V; // V is a 5-bit register: 4 3 2 1 0

 regfile_8_4b uut(WADDR2, WADDR1, WADDR0, WEN, DATA_IN, CLK,
 XRADDR2, XRADDR1, XRADDR0, YRADDR2, YRADDR1, YRADDR0, DATA_X, DATA_Y);
initial begin
 $display("Testbench start");
 $display("Cr| X Y ");
 {WADDR2, WADDR1, WADDR0, WEN, DATA_IN,
 XRADDR2, XRADDR1, XRADDR0, YRADDR2, YRADDR1, YRADDR0, V} = 19'b0000111000000000000;
 // From left to right, WADDR is 000, WEN is 0, DATA_IN is 1110 (E), XRADDR is 000,
 // YRADDR is 000, and V is 00000.
 // Since WEN = 0, nothing is written.
 // Since XRADDR is 000 and YRADDR is 000, the contents of register 0 will
 // be sent to both outputs DATA_X and DATA_Y.
 end
 // always block runs to simulate inputs here.
 // Since inputs are set in the always block, each value set
 // must be declared as reg.
 always begin
 #10;
 $display("%d | %d %d ", V, DATA_X, DATA_Y);

 if (V == 22) begin //if block runs when V is 10110 (22 in dec)
 $display("Testbench end");
 $finish;
 end else begin //else block runs when V isn't 10110 (not 22 in dec)
 V = V + 1; //Increment (increase the value of) V by 1.
 CLK = V[0]; // Clock is the LSB of V.
 case (V[4:1]) // These are the 5 most significant bits of V.
 // Writes E to register 0.
 0: {WADDR2, WADDR1, WADDR0, WEN, DATA_IN, XRADDR2, XRADDR1, XRADDR0,
 YRADDR2, YRADDR1, YRADDR0} = 14'b00011110000000;
 // Writes 8 to register 1.
 1: {WADDR2, WADDR1, WADDR0, WEN, DATA_IN, XRADDR2, XRADDR1, XRADDR0,
 YRADDR2, YRADDR1, YRADDR0} = 14'b00111000000000;
 // Writes 7 to register 2.
 2: {WADDR2, WADDR1, WADDR0, WEN, DATA_IN, XRADDR2, XRADDR1, XRADDR0,
 YRADDR2, YRADDR1, YRADDR0} = 14'b01010111000000;
 // Writes 6 to register 6.
 3: {WADDR2, WADDR1, WADDR0, WEN, DATA_IN, XRADDR2, XRADDR1, XRADDR0,
 YRADDR2, YRADDR1, YRADDR0} = 14'b11010110000000;
 // Writes 5 to register 3.
 4: {WADDR2, WADDR1, WADDR0, WEN, DATA_IN, XRADDR2, XRADDR1, XRADDR0,
 YRADDR2, YRADDR1, YRADDR0} = 14'b01110101010001;
 // Writes 9 to register 4.
 5: {WADDR2, WADDR1, WADDR0, WEN, DATA_IN, XRADDR2, XRADDR1, XRADDR0,
 YRADDR2, YRADDR1, YRADDR0} = 14'b10011001010110;
 // Writes 3 to register 7.
 6: {WADDR2, WADDR1, WADDR0, WEN, DATA_IN, XRADDR2, XRADDR1, XRADDR0,
 YRADDR2, YRADDR1, YRADDR0} = 14'b11110011010010;
 // Writes 0 to register 0.
 7: {WADDR2, WADDR1, WADDR0, WEN, DATA_IN, XRADDR2, XRADDR1, XRADDR0,
 YRADDR2, YRADDR1, YRADDR0} = 14'b00010000100011;
 // Writes 1 to register 5.
 8: {WADDR2, WADDR1, WADDR0, WEN, DATA_IN, XRADDR2, XRADDR1, XRADDR0,
 YRADDR2, YRADDR1, YRADDR0} = 14'b10110001111111;
 // Do nothing.
 9: {WADDR2, WADDR1, WADDR0, WEN, DATA_IN, XRADDR2, XRADDR1, XRADDR0,
 YRADDR2, YRADDR1, YRADDR0} = 14'b11101101101000;
 // Do nothing.
 10: {WADDR2, WADDR1, WADDR0, WEN, DATA_IN, XRADDR2, XRADDR1, XRADDR0,
 YRADDR2, YRADDR1, YRADDR0} = 14'b01001010101100;
 endcase
 end
