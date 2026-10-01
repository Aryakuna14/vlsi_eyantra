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

reg [13:0] counter;

always @(posedge clk_5MHz or negedge reset_n) begin
    if (!reset_n) begin
        counter    <= 14'd0;
        clk_500Hz  <= 1'b0;
        pwm_signal <= 1'b0;
    end
    else begin

        // 10,000 cycles of 5 MHz = 2 ms = 500 Hz
        if (counter == 14'd9999)
            counter <= 14'd0;
        else
            counter <= counter + 1'b1;

        // Generate 500 Hz clock
        // HIGH for first 5000 counts,
        // LOW for next 5000 counts
        if (counter < 14'd5000)
            clk_500Hz <= 1'b1;
        else
            clk_500Hz <= 1'b0;

        // Generate PWM signal
        if (counter < (pulse_width * 14'd500))
            pwm_signal <= 1'b1;
        else
            pwm_signal <= 1'b0;

    end
end
 
//////////////////DO NOT MAKE ANY CHANGES BELOW THIS LINE//////////////////

endmodule

