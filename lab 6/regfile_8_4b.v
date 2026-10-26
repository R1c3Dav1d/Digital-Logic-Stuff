`timescale 1ns / 1ps

module regfile_8_4b (WADDR2, WADDR1, WADDRO, WEN, DATA_IN, CLK, XRADDR2, XRADDR1, XRADDRO, YRADDR2, YRADDR1, YRADDRO, DATA_X, DATA_Y);
    input WADDR2, WADDR1, WADDRO, WEN, CLK;
    input XRADDR2, XRADDR1, XRADDRO, YRADDR2, YRADDR1, YRADDRO;
    input [3:0] DATA_IN;
    output [3:0] DATA_X, DATA_Y;

    wire act7, act6, act5, act4, act3, act2, act1, act0;
    wire [3:0] rq7, rq6, rq5, rq4, rq3, rq2, rq1, rq0;

    // 1. Write Decoder (3-to-8 decoder with write enable)
    // Produces one-hot encoded activation signals for the registers when WEN is high
    assign act7 = WEN & WADDR2 & WADDR1 & WADDRO;
    assign act6 = WEN & WADDR2 & WADDR1 & ~WADDRO;
    assign act5 = WEN & WADDR2 & ~WADDR1 & WADDRO;
    assign act4 = WEN & WADDR2 & ~WADDR1 & ~WADDRO;
    assign act3 = WEN & ~WADDR2 & WADDR1 & WADDRO;
    assign act2 = WEN & ~WADDR2 & WADDR1 & ~WADDRO;
    assign act1 = WEN & ~WADDR2 & ~WADDR1 & WADDRO;
    assign act0 = WEN & ~WADDR2 & ~WADDR1 & ~WADDRO;

    // 2. Eight 4-bit Registers
    reg4b reg_inst7 (.L(act7), .N(DATA_IN), .CLK(CLK), .PRS_N(1'b1), .CLR_N(1'b1), .Q(rq7));
    reg4b reg_inst6 (.L(act6), .N(DATA_IN), .CLK(CLK), .PRS_N(1'b1), .CLR_N(1'b1), .Q(rq6));
    reg4b reg_inst5 (.L(act5), .N(DATA_IN), .CLK(CLK), .PRS_N(1'b1), .CLR_N(1'b1), .Q(rq5));
    reg4b reg_inst4 (.L(act4), .N(DATA_IN), .CLK(CLK), .PRS_N(1'b1), .CLR_N(1'b1), .Q(rq4));
    reg4b reg_inst3 (.L(act3), .N(DATA_IN), .CLK(CLK), .PRS_N(1'b1), .CLR_N(1'b1), .Q(rq3));
    reg4b reg_inst2 (.L(act2), .N(DATA_IN), .CLK(CLK), .PRS_N(1'b1), .CLR_N(1'b1), .Q(rq2));
    reg4b reg_inst1 (.L(act1), .N(DATA_IN), .CLK(CLK), .PRS_N(1'b1), .CLR_N(1'b1), .Q(rq1));
    reg4b reg_inst0 (.L(act0), .N(DATA_IN), .CLK(CLK), .PRS_N(1'b1), .CLR_N(1'b1), .Q(rq0));

    
    assign DATA_X = (XRADDR2 ? 
                        (XRADDR1 ? 
                            (XRADDRO ? rq7 : rq6) : 
                            (XRADDRO ? rq5 : rq4)) : 
                        (XRADDR1 ? 
                            (XRADDRO ? rq3 : rq2) : 
                            (XRADDRO ? rq1 : rq0)));

    // 4. Read Port Y Multiplexer (8-to-1 4-bit MUX)
    assign DATA_Y = (YRADDR2 ? 
                        (YRADDR1 ? 
                            (YRADDRO ? rq7 : rq6) : 
                            (YRADDRO ? rq5 : rq4)) : 
                        (YRADDR1 ? 
                            (YRADDRO ? rq3 : rq2) : 
                            (YRADDRO ? rq1 : rq0)));

endmodule
