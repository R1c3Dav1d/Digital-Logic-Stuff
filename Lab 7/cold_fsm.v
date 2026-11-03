
`timescale 1ns / 1ps

module cold_fsm (
    input CLK,
    input EN,
    output reg [3:0] ONECOLD,
    output reg [1:0] STATE_OUT
);

    // State definitions
    parameter SL  = 2'b00;
    parameter SML = 2'b01;
    parameter SMR = 2'b10;
    parameter SR  = 2'b11;

    reg [1:0] state = SL;
    reg [1:0] next_state;

    // State register
    always @(posedge CLK) begin
        state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        next_state = state;

        if (EN) begin
            case (state)
                SL:  next_state = SML;
                SML: next_state = SMR;
                SMR: next_state = SR;
                SR:  next_state = SL;
                default: next_state = SL;
            endcase
        end
    end

    // Output logic
    always @(*) begin
        STATE_OUT = state;

        case (state)
            SL:  ONECOLD = 4'b0111;
            SML: ONECOLD = 4'b1011;
            SMR: ONECOLD = 4'b1101;
            SR:  ONECOLD = 4'b1110;
            default: ONECOLD = 4'b0111;
        endcase
    end

endmodule
