`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 07:17:21 PM
// Design Name: 
// Module Name: PC
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

module PC (input [3:0] d, input reset, input clk, input jump, output logic [3:0] q, input updown);

 
 
 always @( posedge clk,negedge reset)
     begin 
     
     if (~reset)
     begin 
     q=0;
     
     end 
     else 
     if(jump)
     q=d;
     else
     begin 
         if(~updown)
         begin
         q[0]=~q[0];
         q[1]=q[1]^q[0];
         q[2]=q[2]^(q[0]&q[1]);
         q[3]=q[3]^(q[0]& q[1] & q[2]);
         end
         else
         begin
         q[0]=~q[0];
         q[1]=~(q[1]^q[0]);
         q[2]=q[2]&(q[0] | q[1])| ~q[2] & ~q[1] & ~q[0];
         q[3]=q[3]&(q[0] | q[1] | q[2])| ~q[3] & ~q[2] & ~q[1] & ~q[0];
         end
     end 
     
     
     end 
 
endmodule
