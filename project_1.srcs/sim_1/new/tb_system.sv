`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 07:00:12 PM
// Design Name: 
// Module Name: tb_system
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

`timescale 1ns / 1ps

module tb_mux;

    // Testbench signals
    reg [7:0] a, imm;          // 8-bit input signals
    reg s;                     // Select signal
    wire [7:0] out;            // Output signal

    // Instantiate the DUT (Device Under Test)
    mux dut (
        .a(a),
        .imm(imm),
        .s(s),
        .out(out)
    );

    // Stimulus
    initial begin
        // Monitor output
        $monitor("Time=%0t | a=%b | imm=%b | s=%b | out=%b", 
                 $time, a, imm, s, out);

        // Initialize inputs
        a = 8'b00000000;
        imm = 8'b11111111;
        s = 0;

        // Test case 1: Select imm
        #10; s = 0; // Expect out = imm (11111111)
        
        // Test case 2: Select a
        #10; s = 1; a = 8'b10101010; // Expect out = a (10101010)

        // Test case 3: Change imm, still select a
        #10; imm = 8'b01010101; // Expect out = a (10101010)

        // Test case 4: Select imm
        #10; s = 0; // Expect out = imm (01010101)

        // Test case 5: Update both a and imm
        #10; a = 8'b00110011; imm = 8'b11001100; s = 1; // Expect out = a (00110011)

        #20; $finish; // End simulation
    end

endmodule
