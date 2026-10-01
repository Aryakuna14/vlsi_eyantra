/*
# Team ID:          eYRC#2432
# Theme:            Logic Quest
# Author List:      Arya Sharan, Trupthi D Revankar, Akshaya Ridhi, Boya Purandara datta
# Filename:         pwm_generator.v
# File Description: Generates a Pulse Width Modulation (PWM) signal using counter-based comparison logic across a parameterized resolution.
# Global variables: None
*/

module pwm_generator #(
    // COUNTER_WIDTH: Bit width of the PWM counter determining resolution (default 4-bit, 16 steps)
    parameter COUNTER_WIDTH = 4
)(
    input clk,                           // Input clock signal
    input [COUNTER_WIDTH-1:0] duty_cycle,// Target duty cycle threshold (0 to 15)
    output reg pwm_out                   // Generated PWM output signal
);

// counter: Internal register tracking current step within the PWM period
reg [COUNTER_WIDTH-1:0] counter = 0;

always @(posedge clk) begin
/*
Purpose:
---
Continuously increments the period counter on each clock pulse.
Compares counter value against duty_cycle to drive pwm_out HIGH during ON duration and LOW during OFF duration.
*/
    counter <= counter + 1'b1;

    if (counter < duty_cycle) begin
        pwm_out <= 1'b1; // Output HIGH during active duty window
    end else begin
        pwm_out <= 1'b0; // Output LOW for remainder of period
    end
end

endmodule