/*
# Team ID:          eYRC#2432
# Theme:            Logic Quest
# Author List:      Arya Sharan, Trupthi D Revankar, Akshaya Ridhi, Boya Purandara datta
# Filename:         sequence_detector.v
# File Description: Finite State Machine (FSM) sequence detector for identifying sequence {1, 0, 9, 4}.
# Global variables: None
*/

module sequence_detector (
    input        clock,
    input  [3:0] number,
    output reg   pattern
);

    // State Machine Parameter Encoding
    localparam ST_ONE  = 2'b00,
               ST_ZERO = 2'b01,
               ST_NINE = 2'b10,
               ST_FOUR = 2'b11;

    // State register initialization
    reg [1:0] state = ST_ONE;

    initial begin
        pattern = 1'b0;
    end

    /*
    * Purpose:
    * Sequential FSM transitions on positive clock edge to detect 4-digit sequence (1, 0, 9, 4).
    * Asserts pattern = 1 when the final matching element '4' is detected in sequence.
    */
    always @(posedge clock) begin
        pattern <= 1'b0;
        case (state)
            ST_ONE: begin
                if (number == 4'd1) 
                    state <= ST_ZERO;
                else 
                    state <= ST_ONE;
            end

            ST_ZERO: begin
                if (number == 4'd0) 
                    state <= ST_NINE;
                else if (number == 4'd1) 
                    state <= ST_ZERO;
                else 
                    state <= ST_ONE;
            end

            ST_NINE: begin
                if (number == 4'd9) 
                    state <= ST_FOUR;
                else if (number == 4'd1) 
                    state <= ST_ZERO;
                else 
                    state <= ST_ONE;
            end

            ST_FOUR: begin
                if (number == 4'd4) begin
                    state   <= ST_ONE;
                    pattern <= 1'b1;
                end else if (number == 4'd1) begin
                    state   <= ST_ZERO;
                end else begin
                    state   <= ST_ONE;
                end
            end

            default: state <= ST_ONE;
        endcase
    end

endmodule