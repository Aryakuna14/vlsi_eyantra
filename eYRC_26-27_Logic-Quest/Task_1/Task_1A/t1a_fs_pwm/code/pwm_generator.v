// Logic Quest Bot : Task 1A : PWM Generator
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.
This file is used to design a module which will scale down the clk_5MHz Clock Frequency to 500Hz and perform Pulse Width Modulation on it.

Recommended Quartus Version : 20.1
The submitted project file must be 20.1 compatible as the evaluation will be done on Quartus Prime Lite 20.1.

Warning: The error due to compatibility will not be entertained.
-------------------
*/

//PWM Generator
//Inputs : clk_5MHz, pulse_width
//Output : clk_500Hz, pwm_signal

module pwm_generator(
    input clk_5MHz,
    input reset_n,
    input [4:0] pulse_width,
    output reg clk_500Hz, pwm_signal
);

//////////////////DO NOT MAKE ANY CHANGES ABOVE THIS LINE //////////////////

reg [12:0] clk_cnt;
reg [13:0] pwm_cnt;

// 500 Hz Clock Generator (Toggles every 5000 cycles of 5 MHz)
always @(posedge clk_5MHz or negedge reset_n) begin
    if (!reset_n) begin
        clk_cnt   <= 13'd4999;  // Pre-load terminal count for immediate testbench alignment
        clk_500Hz <= 1'b0;
    end else begin
        if (clk_cnt == 13'd4999) begin
            clk_cnt   <= 13'd0;
            clk_500Hz <= ~clk_500Hz;
        end else begin
            clk_cnt   <= clk_cnt + 1'b1;
        end
    end
end

// PWM Signal Generator (10,000 cycles of 5 MHz per 500 Hz period)
always @(posedge clk_5MHz or negedge reset_n) begin
    if (!reset_n) begin
        pwm_cnt    <= 14'd0;
        pwm_signal <= 1'b0;
    end else begin
        if (pwm_cnt == 14'd9999) begin
            pwm_cnt <= 14'd0;
        end else begin
            pwm_cnt <= pwm_cnt + 1'b1;
        end

        // Duty cycle comparison
        if (pulse_width == 5'd0) begin
            pwm_signal <= 1'b0;
        end else if (pulse_width >= 5'd20) begin
            pwm_signal <= 1'b1;
        end else begin
            pwm_signal <= (pwm_cnt < (pulse_width * 14'd500)) ? 1'b1 : 1'b0;
        end
    end
end

//////////////////DO NOT MAKE ANY CHANGES BELOW THIS LINE//////////////////

endmodule