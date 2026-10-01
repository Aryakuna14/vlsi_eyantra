/*
# Team ID:          eYRC#2432
# Theme:            Logic Quest
# Author List:      Arya Sharan, Trupthi D Revankar, Akshaya Ridhi, Boya Purandara datta
# Filename:         full_adder.v
# File Description: 1-bit Full Adder module used as a component in arithmetic logic circuits.
# Global variables: None
*/

module full_adder (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);

    /*
    * Purpose:
    * Computes the 1-bit sum and carry-out using standard combinational logic.
    */
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule