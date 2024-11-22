`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 07:16:49 PM
// Design Name: 
// Module Name: Instruction_memory
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


module Instruction_memory(
//input logic [2:0]imm,
input logic [3:0] PC, 
output logic [7:0]comm
    );
    always@(*)
    begin
    case(PC)
    4'b0000: comm = 8'b00001000; 
    4'b0001: comm = 8'b00011001; 
    4'b0010: comm = 8'b00100000; 
    4'b0011: comm = 8'b00010000; 
    4'b0100: comm = 8'b01110000;
    
    
    4'b0101: comm = 8'b00000000; 
    4'b0110: comm = 8'b00010100; 
    4'b0111: comm = 8'b00000100; 
    4'b1000: comm = 8'b10110010; 
    default comm =  8'bX;
    endcase
    end
     
   endmodule
