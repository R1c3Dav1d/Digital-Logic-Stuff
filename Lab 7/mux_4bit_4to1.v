// 4-bit 4-to-1 Multiplexer
module mux_4bit_4to1 (
    input [3:0] I3, I2, I1, I0,
    input [1:0] S,
    output reg [3:0] Y
);
    always @(*) begin
        case (S)
            2'b11: Y = I3;
            2'b10: Y = I2;
            2'b01: Y = I1;
            2'b00: Y = I0;
            default: Y = 4'b0000;
        endcase
    end
endmodule
