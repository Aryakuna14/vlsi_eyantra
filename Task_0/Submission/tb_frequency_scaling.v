/*
# Team ID:          eYRC#2432
# Theme:            Logic Quest
# Author List:      Arya Sharan, Trupthi D Revankar, Akshaya Ridhi, Boya Purandara datta
# Filename:         tb_frequency_scaling.v
# File Description: Testbench to verify frequency scaling output clock toggles at the expected divided frequency.
# Global variables: None
*/

`timescale 1ns / 1ps

module tb_frequency_scaling;

    reg clk_50M;
    wire clk_3125KHz;

    // Instantiate Design Under Test (DUT) with matching port names
    frequency_scaling uut (
        .clk_50M(clk_50M),
        .clk_3125KHz(clk_3125KHz)
    );

    // 50MHz input clock generation (20ns period)
    always #10 clk_50M = ~clk_50M;

    initial begin
        // Initialize signals
        clk_50M = 0;

        // Run simulation to observe several output clock cycles
        #2000;
        $finish;
    end

endmodule