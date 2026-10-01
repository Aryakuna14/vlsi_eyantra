/// Verilog code for test bench of sevensegment
// Define module
`timescale 1ns / 1ps

module tb_seven_segment;

    // Inputs & Outputs
    reg [3:0] bcd;
    wire [6:0] display;

    // Instantiate Unit Under Test (UUT)
    seven_segment uut (
        .bcd(bcd), 
        .display(display)
    );

    // Single sequential initial block
    initial begin
        // Monitor outputs in simulator console
        $monitor("Time = %0t ns | BCD = %b (%0d) | Display = %b", $time, bcd, bcd, display);

        // Apply stimulus step by step
        bcd = 4'b0000; #100;
        bcd = 4'b0001; #100;
        bcd = 4'b0011; #100;
        bcd = 4'b1000; #100;
        bcd = 4'b1001; #100;

        // Stop simulation
        $finish;
    end

endmodule