/*
# Team ID:          eYRC#2432
# Theme:            Logic Quest
# Author List:      Arya Sharan, Trupthi D Revankar, Akshaya Ridhi, Boya Purandara datta
# Filename:         ripple_carry_adder.v
# File Description: 2-bit Ripple Carry Adder constructed by cascading two 1-bit full adder modules.
# Global variables: None
*/

module ripple_carry_adder (
    input  [1:0] a,
    input  [1:0] b,
    input        cin,
    output [1:0] sum,
    output       c_out
);

    wire c1;

    /*
    * Purpose:
    * Instantiates two 1-bit full adders in series to perform 2-bit addition with ripple carry propagation.
    */
    full_adder FA0 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(c1)
    );

    full_adder FA1 (
        .a(a[1]),
        .b(b[1]),
        .cin(c1),
        .sum(sum[1]),
        .cout(c_out)
    );

endmodule