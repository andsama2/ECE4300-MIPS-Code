`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 03:05:56 PM
// Design Name: 
// Module Name: S_EXTEND
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


module S_EXTEND(
    input [15:0] IF_ID_instr,
    output [31:0] IF_ID_instr_ext
    );
   
    assign IF_ID_instr_ext =  {{16{IF_ID_instr[15]}}, IF_ID_instr};
    
endmodule
