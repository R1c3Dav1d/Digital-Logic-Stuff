// Cold FSM matching the state diagram (Figure 1b)
module cold_fsm (
    input CLK,
    input EN,
    output reg [3:0] ONECOLD,
    output reg [1:0] STATE_OUT
);
    // State encoding based on ONECOLD values in Figure 1b
    // SR = 1110 (Q=00), SMR = 1010 / 1011, etc.
    reg [1:0] state, next_state;

    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    always @(posedge CLK) begin
        state <= next_state;
    end

    always @(*) begin
        case (state)
            S0: next_state = S1;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S0;
            default: next_state = S0;
        endcase
    end

    always @(*) begin
        STATE_OUT = state;
        if (EN) begin
            case (state)
                S0: ONECOLD = 4'b1110; // Digit 0 active (active low)
                S1: ONECOLD = 4'b1101; // Digit 1 active
                S2: ONECOLD = 4'b1011; // Digit 2 active
                S3: ONECOLD = 4'b0111; // Digit 3 active
                default: ONECOLD = 4'b1111;
            endcase
        end else begin
            // Behavior when EN = 0 (turns off or shows specific states as per lab guide)
            ONECOLD = 4'b1110; 
        end
    end
endmodule
