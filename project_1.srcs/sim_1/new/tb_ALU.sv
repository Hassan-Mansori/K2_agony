`timescale 1ns / 1ps

module tb_ALU;

    // Testbench signals
    reg [3:0] a, b;          // Operands
    reg sel;                 // Operation selector
    wire [3:0] result;       // ALU result
    wire carry_out;          // Carry or borrow out
    wire overflow;           // Overflow flag

    // Instantiate the ALU module
    ALU dut (
        .a(a),
        .b(b),
        .sel(sel),
        .result(result),
        .carry_out(carry_out),
        .overflow(overflow)
    );

    // Testbench stimulus
    initial begin
        // Monitor signals
        $monitor("Time=%0t | a=%b, b=%b, sel=%b | result=%b, carry_out=%b, overflow=%b", 
                 $time, a, b, sel, result, carry_out, overflow);

        // Test case 1: Addition without carry
        a = 4'b0011; b = 4'b0101; sel = 0; // 3 + 5 = 8
        #10;

        // Test case 2: Addition with carry
        a = 4'b1111; b = 4'b0001; sel = 0; // 15 + 1 = 16 (overflow, carry)
        #10;

        // Test case 3: Subtraction without borrow
        a = 4'b0101; b = 4'b0011; sel = 1; // 5 - 3 = 2
        #10;

        // Test case 4: Subtraction with borrow
        a = 4'b0011; b = 4'b0100; sel = 1; // 3 - 4 = -1 (borrow out)
        #10;

        // Test case 5: Subtraction with overflow
        a = 4'b1000; b = 4'b0001; sel = 1; // 8 - 1 = 7 (no borrow, but overflow)
        #10;

        // Test case 6: Subtraction causing borrow and overflow
        a = 4'b1000; b = 4'b1001; sel = 1; // 8 - 9 = -1 (borrow and overflow)
        #10;

        $finish; // End simulation
    end

endmodule
