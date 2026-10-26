`timescale 1ns / 1ps

module register (L, N, CLK, PRS_N, CLR_N, Q);
    input L, N, CLK, PRS_N, CLR_N;
    output reg Q;

    always @(posedge CLK or negedge PRS_N or negedge CLR_N) begin
        if (!CLR_N)
            Q <= 1'b0;
        else if (!PRS_N)
            Q <= 1'b1;
        else if (L)
            Q <= N;
        else
            Q <= Q;
    end

endmodule
