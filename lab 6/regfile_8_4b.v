`timescale 1ns / 1ps

module regfile_8_4b (WADDR2, WADDR1, WADDR0, WEN, DATA_IN, CLK, XRADDR2, XRADDR1, XRADDR0, YRADDR2, YRADDR1, YRADDR0, DATA_X, DATA_Y);
    input WADDR2, WADDR1, WADDR0, WEN, CLK;
    input XRADDR2, XRADDR1, XRADDR0, YRADDR2, YRADDR1, YRADDR0;
    input [3:0] DATA_IN;
    output [3:0] DATA_X, DATA_Y;

    wire act7, act6, act5, act4, act3, act2, act1, act0;
    wire [3:0] rq7, rq6, rq5, rq4, rq3, rq2, rq1, rq0;

    // Decoder for write port
    decoder_3to8 dec (
        .WADDR2(WADDR2), .WADDR1(WADDR1), .WADDR0(WADDR0), .WEN(WEN),
        .act7(act7), .act6(act6), .act5(act5), .act4(act4),
        .act3(act3), .act2(act2), .act1(act1), .act0(act0)
    );

    // Eight 4-bit registers
    reg4b r0 (.L(act0), .N(DATA_IN), .CLK(CLK), .PRS_N(1'b1), .CLR_N(1'b1), .Q(rq0));
    reg4b r1 (.L(act1), .N(DATA_IN), .CLK(CLK), .PRS_N(1'b1), .CLR_N(1'b1), .Q(rq1));
    reg4b r2 (.L(act2), .N(DATA_IN), .CLK(CLK), .PRS_N(1'b1), .CLR_N(1'b1), .Q(rq2));
    reg4b r3 (.L(act3), .N(DATA_IN), .CLK(CLK), .PRS_N(1'b1), .CLR_N(1'b1), .Q(rq3));
    reg4b r4 (.L(act4), .N(DATA_IN), .CLK(CLK), .PRS_N(1'b1), .CLR_N(1'b1), .Q(rq4));
    reg4b r5 (.L(act5), .N(DATA_IN), .CLK(CLK), .PRS_N(1'b1), .CLR_N(1'b1), .Q(rq5));
    reg4b r6 (.L(act6), .N(DATA_IN), .CLK(CLK), .PRS_N(1'b1), .CLR_N(1'b1), .Q(rq6));
    reg4b r7 (.L(act7), .N(DATA_IN), .CLK(CLK), .PRS_N(1'b1), .CLR_N(1'b1), .Q(rq7));

    // Read Port X Multiplexer
    mux8_4b mux_x (
        .RADDR2(XRADDR2), .RADDR1(XRADDR1), .RADDR0(XRADDR0),
        .d0(rq0), .d1(rq1), .d2(rq2), .d3(rq3),
        .d4(rq4), .d5(rq5), .d6(rq6), .d7(rq7),
        .y(DATA_X)
    );

    // Read Port Y Multiplexer
    mux8_4b mux_y (
        .RADDR2(YRADDR2), .RADDR1(YRADDR1), .RADDR0(YRADDR0),
        .d0(rq0), .d1(rq1), .d2(rq2), .d3(rq3),
        .d4(rq4), .d5(rq5), .d6(rq6), .d7(rq7),
        .y(DATA_Y)
    );

endmodule
