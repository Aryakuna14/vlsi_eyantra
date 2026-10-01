/*
# Team ID:          eYRC#2432
# Theme:            Logic Quest
# Author List:      Arya Sharan, Trupthi D Revankar, Akshaya Ridhi, Boya Purandara datta
# Filename:         sequence_detector.v
# File Description: Finite State Machine (FSM) sequence detector for identifying sequence {1, 0, 9, 4}.
# Global variables: None
*/


`timescale 1ns / 1ps

module tb_sequence_detector;

    reg clock;
    reg [3:0] number;
    wire pattern;

    // Instantiate sequence detector
    sequence_detector uut (
        .clock(clock),
        .number(number),
        .pattern(pattern)
    );

    // Generate 10ns clock
    always #5 clock = ~clock;

    initial begin
        clock = 0;
        number = 0;

        #10;
        
        // Sequence: 1 -> 0 -> 9 -> 4
        @(posedge clock) number = 4'd1;
        @(posedge clock) number = 4'd0;
        @(posedge clock) number = 4'd9;
        @(posedge clock) number = 4'd4; // pattern pulses HIGH here
        
        @(posedge clock) number = 4'd0;
        #20;
        $stop;
    end

endmodule