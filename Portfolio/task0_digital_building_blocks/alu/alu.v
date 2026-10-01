// Verilog Design for an 8-bit ALU
module alu (
    input clk, en,           // Clock and synchronous enable signal
    input [7:0] a, b,
    input [3:0] s,           // Inputs a, b and select line s
    output reg [15:0] y,     // 16-bit ALU output
    output reg carry, zero   // Flag outputs
);

reg [7:0] a_in, b_in;
reg [1:0] flags;             // flags[0] = carry, flags[1] = zero
reg [15:0] out_y;

initial begin
    y = 0; carry = 0; zero = 0;
    a_in = 0; b_in = 0;
end

// Synchronous sequential block
always @(posedge clk) begin
    if (en) begin
        // Reset/clear registers when enabled (matching original logic intent)
        a_in  <= 8'd0;
        b_in  <= 8'd0;
        y     <= 16'd0;
        carry <= 1'b0;
        zero  <= 1'b0;
    end
    else begin
        // Latch inputs and update output registers
        a_in  <= a;
        b_in  <= b;
        y     <= out_y;
        carry <= flags[0];
        zero  <= flags[1];
    end
end

// Pure combinational block
always @(*) begin
    flags = 2'b00; // Default clear flags to prevent latches
    out_y = 16'd0;

    case (s)
        4'd0: begin // Addition
            out_y = {8'd0, a_in} + {8'd0, b_in};
            flags[0] = out_y[8]; // Bit 8 correctly holds the carry-out
        end
        4'd1: begin // Subtraction
            out_y = {8'd0, a_in} - {8'd0, b_in};
            flags[0] = out_y[8]; // Borrow flag
        end
        4'd2: begin // Increment
            out_y = {8'd0, a_in} + 16'd1;
            flags[0] = out_y[8];
        end
        4'd3: begin // Decrement
            out_y = {8'd0, a_in} - 16'd1;
            flags[0] = out_y[8];
        end
        4'd4:  out_y = a_in * b_in;                  // Multiplication
        4'd5:  out_y = (b_in != 0) ? (a_in / b_in) : 16'd0; // Division (guard zero div)
        4'd6:  out_y = {8'd0, (a_in & b_in)};        // Bitwise AND
        4'd7:  out_y = {8'd0, (a_in | b_in)};        // Bitwise OR
        4'd8:  out_y = {8'd0, (a_in ^ b_in)};        // Bitwise XOR
        4'd9:  out_y = {8'd0, ~(a_in & b_in)};       // Bitwise NAND
        4'd10: out_y = {8'd0, ~(a_in | b_in)};       // Bitwise NOR
        4'd11: out_y = {8'd0, ~(a_in ^ b_in)};       // Bitwise XNOR
        4'd12: begin // Shift Left
            flags[0] = a_in[7];
            out_y = {8'd0, (a_in << 1)};
        end
        4'd13: begin // Shift Right
            flags[0] = a_in[0];
            out_y = {8'd0, (a_in >> 1)};
        end
        4'd14: out_y = {8'd0, a_in[0], a_in[7:1]};   // Rotate Right
        4'd15: out_y = {8'd0, a_in[6:0], a_in[7]};   // Rotate Left
        default: out_y = 16'd0;
    endcase

    if (out_y == 16'd0) 
        flags[1] = 1'b1; // Zero flag evaluation
end

endmodule