/*
# Team ID:          eYRC#2432
# Theme:            Logic Quest
# Author List:      Arya Sharan, Trupthi D Revankar, Akshaya Ridhi, Boya Purandara datta
# Filename:         tb_pwm_generator.v
# File Description: Testbench to verify PWM output across different duty cycle values.
# Global variables: None
*/

`timescale 1ns / 1ps

module tb_pwm_generator;

    reg clk;
    reg [3:0] duty_cycle;
    wire pwm_out;

    // Instantiate Design Under Test (DUT)
    pwm_generator uut (
        .clk(clk),
        .duty_cycle(duty_cycle),
        .pwm_out(pwm_out)
    );

    // Clock generation: 100ns period (10MHz)
    always #50 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        duty_cycle = 4'd0;

        // Test Case 1: 0% Duty Cycle
        #100;
        duty_cycle = 4'd0;

        // Test Case 2: 25% Duty Cycle (4/16)
        #1600;
        duty_cycle = 4'd4;

        // Test Case 3: 50% Duty Cycle (8/16)
        #1600;
        duty_cycle = 4'd8;

        // Test Case 4: 75% Duty Cycle (12/16)
        #1600;
        duty_cycle = 4'd12;

        // Test Case 5: 100% Duty Cycle (15/16)
        #1600;
        duty_cycle = 4'd15;

        #1600;
        $finish;
    end

endmodule