// Verilog Test Bench code for AND gate
module and_gate_test_bench;

reg a, b;
wire out;

AND_GATE uut (.a(a), .b(b), .out(out));


initial begin
    a = 0; b = 0; #100;
    a = 0; b = 1; #100;
    a = 1; b = 0; #100;
    a = 1; b = 1; #100;
    $stop; 
end

endmodule