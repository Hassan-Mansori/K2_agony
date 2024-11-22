`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 09:21:13 AM
// Design Name: 
// Module Name: K2_agony
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


module K2_agony (
    logic [3:0] pc_bus,
    input clk,
   logic [7:0] comand_bus,
   logic [7:0] ra_bus,
   logic [7:0] rb_bus,
   logic [7:0] r0_bus,
   logic [3:0] decoder_bus,
   logic [7:0] mux_bus,
   logic [7:0] alu_bus,
   logic carry_bus,
   logic dff_bus,
   logic and_bus,
   logic or_bus,
   logic jump_bus,
    logic reset,
    logic updown,
    logic overflow    );
    
    //instruction memory
    Instruction_memory im( .PC(pc_bus), .comm(comand_bus));

    //pc counter 
    PC pc_counter (.d(comand_bus[3:0]), .jump(or_bus),.q(pc_bus), .reset(reset), .clk(clk), .updown(updown));
        assign updown = 1;

    
    //decoder
    decoder d1( .d0(comand_bus[4]), .d1(comand_bus[5]), .out(decoder_bus));
    
    //registers
    rege #(8) ra(.en(decoder_bus[0]), .clk(clk), .I(mux_bus), .Q(ra_bus), .reset(reset));
    rege #(8) rb(.en(decoder_bus[1]), .clk(clk), .I(mux_bus), .Q(rb_bus), .reset(reset));
    rege #(8) r0(.en(decoder_bus[2]), .clk(clk), .I(ra_bus), .Q(r0_bus), .reset(reset));
    
    
    //mux
    mux m1(.a(alu_bus), .imm(comand_bus[2:0]), . s(comand_bus[3]), .out(mux_bus));
    
    //ALU
    ALU al(.a(ra_bus), .b(rb_bus), .sel(comand_bus[2]), .result(alu_bus), .carry_out(carry_bus), .overflow(overflow) );
    
    //DFF
      rege #(1) rdff(.en(1), .clk(clk), .I(carry_bus), .Q(and_bus));
        and(jump_bus,and_bus,comand_bus[6]);
        or(or_bus,jump_bus,comand_bus[7]);

endmodule
