`timescale 1ns / 1ps
module TFF(
    input T,
    input CLK,
    input PRS_N,
    input CLR_N,
    output reg Q,
    output reg Q_N
);

    always @(posedge CLK or negedge PRS_N or negedge CLR_N) begin
        if (PRS_N == 0) begin
            // Active-low asynchronous PRESET
            Q   <= 1'b1;
            Q_N <= 1'b0;
        end else if (CLR_N == 0) begin
            // Active-low asynchronous CLEAR
            Q   <= 1'b0;
            Q_N <= 1'b1;
        end else begin
            // Synchronous TFF characteristic behavior: Q_next = T ^ Q
            Q   <= T ^ Q;
            Q_N <= ~(T ^ Q);
        end
    end

endmodule
