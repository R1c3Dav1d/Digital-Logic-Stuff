`timescale 1ns / 1ps
module ctr_4bsdp(EN, CLK, RESET_N, W3, W2, W1, W0);
 input EN, CLK, RESET_N;
 output W3, W2, W1, W0;
 // You will need to create 4 TFFs in order to make this counter.
 // Reset should reset the output back to 1111.
 // Enable should stop the counter in its tracks.
 // Pay special attention to EN stopping the counter at 8.
 // If you only apply EN to one FF, the other ones may keep going.
 wire t3_en, t2_en, t1_en, t0_en;
  

 assign t0_en = EN;
 assign t1_en = EN & ~W0;
 assign t2_en = EN & ~W0 & ~W1; 
 assign t3_en = EN & ~W0 & ~W1 & ~W2;
 // Feel free to declare more wires in order to realize your counter.
  TFF tff0(t0_en, CLK, RESET_N, W0);
  TFF tff1(t1_en, CLK, RESET_N, W1);
  TFF tff2(t2_en, CLK, RESET_N, W2);
  TFF tff3(t3_en, CLK, RESET_N, W3);

endmodule
