`timescale 1ns / 1ps
module DFF(
    input D,
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
            // Synchronous DFF characteristic behavior: Q_next = D
            Q   <= D;
            Q_N <= ~D;
        end
    end

endmodule
