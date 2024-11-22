`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 06:51:44 PM
// Design Name: 
// Module Name: tb_rege
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

module tb_rege;

    parameter n = 4;            // Parameter for bit width

    // Testbench signals
    reg [n-1:0] I;              // Input data
    reg clk;                    // Clock signal
    reg en;                     // Enable signal
    wire [n-1:0] Q;             // Output data

    // Instantiate the DUT (Device Under Test)
    rege #(n) dut (
        .I(I),
        .clk(clk),
        .en(en),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Stimulus
    initial begin
        // Monitor output
        $monitor("Time=%0t | I=%b | clk=%b | en=%b | Q=%b", 
                 $time, I, clk, en, Q);

        // Initialize signals
        I = 4'b0000; en = 0;

        // Apply test cases
        #10; I = 4'b1010; en = 1; // Enable and load new data
        #10; I = 4'b1100;         // Change input while enabled
        #10; en = 0; I = 4'b1111; // Disable, input changes but output holds
        #10; en = 1; I = 4'b0101; // Enable again, load new data

        #20;                      // Wait for a few clock cycles
        $finish;                  // End simulation
    end

endmodule
