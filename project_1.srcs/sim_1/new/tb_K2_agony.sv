`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 12:29:30 PM
// Design Name: 
// Module Name: tb_K2_agony
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


module tb_K2_agony;

    // Testbench signals
    reg clk, reset;                              // Clock signal
    wire [3:0] pc_bus;                    // Program counter
    wire [7:0] comand_bus;                // Command bus
    wire [7:0] ra_bus, rb_bus, r0_bus;    // Register buses
    wire [3:0] decoder_bus;               // Decoder bus
    wire [7:0] mux_bus, alu_bus;          // Mux and ALU buses
    wire carry_bus, dff_bus, and_bus, or_bus, jump_bus; // Control signals

    // Instantiate the DUT (Device Under Test)
    K2_agony dut (
        .pc_bus(pc_bus),
        .clk(clk),
        .comand_bus(comand_bus),
        .ra_bus(ra_bus),
        .rb_bus(rb_bus),
        .r0_bus(r0_bus),
        .decoder_bus(decoder_bus),
        .mux_bus(mux_bus),
        .alu_bus(alu_bus),
        .carry_bus(carry_bus),
        .dff_bus(dff_bus),
        .and_bus(and_bus),
        .or_bus(or_bus),
        .jump_bus(jump_bus),
        .reset(reset)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test sequence
    initial begin
        // Monitor signals for debugging
         reset = 0;
       #10
       reset = 1;
       #10
        $monitor("Time=%0t | PC=%b | Command=%b | RA=%b | RB=%b | R0=%b | ALU=%b | Carry=%b | Jump=%b", 
                 $time, pc_bus, comand_bus, ra_bus, rb_bus, r0_bus, alu_bus, carry_bus, jump_bus);
        // Reset state
        #0; // Initial state at time=0
        #100; // Run for 100 ns
        $finish; // End simulation
    end

endmodule
