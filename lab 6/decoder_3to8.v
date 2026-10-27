`timescale 1ns / 1ps

module decoder_3to8 (WADDR2, WADDR1, WADDR0, WEN, act7, act6, act5, act4, act3, act2, act1, act0);
    input WADDR2, WADDR1, WADDR0, WEN;
    output act7, act6, act5, act4, act3, act2, act1, act0;

    assign act0 = WEN & (~WADDR2 & ~WADDR1 & ~WADDR0);
    assign act1 = WEN & (~WADDR2 & ~WADDR1 &  WADDR0);
    assign act2 = WEN & (~WADDR2 &  WADDR1 & ~WADDR0);
    assign act3 = WEN & (~WADDR2 &  WADDR1 &  WADDR0);
    assign act4 = WEN & ( WADDR2 & ~WADDR1 & ~WADDR0);
    assign act5 = WEN & ( WADDR2 & ~WADDR1 &  WADDR0);
    assign act6 = WEN & ( WADDR2 &  WADDR1 & ~WADDR0);
    assign act7 = WEN & ( WADDR2 &  WADDR1 &  WADDR0);

endmodule
