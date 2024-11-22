`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 07:05:09 PM
// Design Name: 
// Module Name: decoder
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


module decoder(
    input d0,d1,
    output [3:0] out
    );
    
    assign out[0] = (~d0 & ~ d1);
    assign out[1] = (d0 & ~d1);
    assign out[2] = (~d0 & d1);
    assign out[3] = (d1 & d0);
    
endmodule
