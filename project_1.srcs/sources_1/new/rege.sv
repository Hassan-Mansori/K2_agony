`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 06:36:21 PM
// Design Name: 
// Module Name: rege
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


module rege #( parameter n = 8) (
        input [n-1: 0] I,
        input clk,
        input en,
        input reset,
        output logic [n - 1: 0] Q
    );
    
    always @(posedge clk, negedge reset)
    if (~reset) 
        Q = 0;
     else if (en) 
        begin
            Q <= I;
         end
endmodule
