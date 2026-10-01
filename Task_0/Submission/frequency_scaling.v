/*
# Team ID:          eYRC#2432
# Theme:            Logic Quest
# Author List:      Arya Sharan, Trupthi D Revankar, Akshaya Ridhi, Boya Purandara datta
# Filename:         frequency_scaling.v
# File Description: Scales down an input 50MHz clock signal to a 3.125MHz clock signal using a 3-bit counter.
# Global variables: None
*/

module frequency_scaling (
    input clk_50M,          // 50 MHz input clock signal
    output reg clk_3125KHz  // 3.125 MHz scaled output clock signal
);

// counter: 3-bit register used to track 8 clock cycles per half-period toggle
reg [2:0] counter = 0;

initial begin
    clk_3125KHz = 0;
end

always @ (posedge clk_50M) begin
/*
Purpose:
---
Increments the internal counter on every rising edge of the 50MHz input clock.
Toggles the 3.125MHz output clock whenever the counter rolls over at 0 (every 8 input cycles).
*/
    if (!counter) begin
        clk_3125KHz <= ~clk_3125KHz; // Toggles output signal every 8 cycles (160 ns)
    end
    counter <= counter + 1'b1;       // Increments counter (wraps from 7 back to 0)
end

endmodule