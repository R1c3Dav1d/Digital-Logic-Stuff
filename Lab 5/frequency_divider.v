`timescale 1ns / 1ps
module frequency_divider (CLKO, CLKF);
 input CLKO;
 output CLKF;
 // This module requires the creating of 25 TFFs.
 // This is to halve the input clock signal CLKO 25 times.
 // You *could* copy-paste 25 lines of TFF module instantiation
 // or you can use the generation for-loop block to do so.

 // To specify the number of TFFs you need, a parameter is declared here.
 parameter CLK_COUNT = 25;

 // The wires which constitute the clock are declared here.
 // Note carefully that this is 26 wires: 0 to 25.
 wire CLKS[CLK_COUNT:0];
 // CLKS[0], or clock 0, is actually the input clock CLKO.
 assign CLKS[0] = CLKO;
 // to generate the 25 TFFs, a variable must be declared as a generator variable
 // here we have giv (generating iteration variable)
 genvar giv;
 // This variable iterates through the variables 1, 2, 3, ... 24, 25.
 // to produce TFF 1, 2, 3, ... 24, 25.
 // Then, for instance, TFF 1 will use clock 0 to produce clock 1.
 // Clock 1 will have half the frequency of clock 0.
 // Clock 2 is produced by TFF 2 and has half the frequency of clock 1.
 // Clock 25 is produced by TFF 25 and has half the frequency of clock 24.
 for ( giv = 1 ; giv <= CLK_COUNT ; giv = giv + 1 ) begin
 TFF tffgiv(.T(1), .CLK(CLKS[giv - 1]), .PRS_N(1), .CLR_N(1), .Q(CLKS[giv]));
 end
 // Finally, set CLKF to the correct clock from the 26 mentioned above. :)
  assign CLKF = CLKS[CLK_COUNT];

endmodule
