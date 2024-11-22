`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 05:22:16 PM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ALU  (
    input logic [7:0] a, // First operand
    input logic [7:0] b, // Second operand
    input logic sel,     // Operation selector: 0 for addition, 1 for subtraction
    output logic [7:0] result, // Result of the operation
    output logic carry_out,    // Carry out for addition or borrow out for subtraction
    output logic overflow      // Overflow flag
);

    logic [8:0] temp_result; // Temporary result to hold 5 bits (to check carry/borrow)

    always_comb begin
        if (sel == 0) begin
            temp_result = a + b; // Addition
        end else begin
            temp_result = a - b; // Subtraction
        end

        result = temp_result[7:0]; // Assign lower 4 bits to result
        carry_out = temp_result[8]; // Assign carry/borrow out
        overflow = (a[7] ^ b[7] ^ sel ^ temp_result[7]); // Overflow detection
    end

endmodule
