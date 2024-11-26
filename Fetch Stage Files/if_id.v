`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2024 11:45:42 AM
// Design Name: 
// Module Name: if_id
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


module if_id(
    input wire clk,
    output reg [31:0] instrout, npcout,
    input wire [31:0] instr, npc
    );
    initial begin
        instrout <= 0;
        npcout <= 0;
    end
    always @ (posedge clk) begin
        instrout <= instr;
        npcout <= npc;
    end
endmodule
