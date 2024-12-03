`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 02:48:13 PM
// Design Name: 
// Module Name: BOTTOM_MUX
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


module BOTTOM_MUX(
    input [4:0] a, b,
    input sel,
    output [4:0] y
    );
    
    assign y = sel? a: b;
    
endmodule
