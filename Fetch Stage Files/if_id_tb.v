`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 09:31:47 PM
// Design Name: 
// Module Name: if_id_tb
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


module if_id_tb(

    );
    reg clk;
    wire [31:0] instrout, npcout;
    reg [31:0] instr, npc;
    
    if_id uut (
        .clk(clk),
        .instrout(instrout),
        .npcout(npcout),
        .instr(instr),
        .npc(npc)
    );
    
    always begin
        clk = 1'b0;
        #5;
        clk = 1'b1;
        #5;
    end
    initial begin
        instr = 32'h00000000;
        npc = 32'h00000000;
        #10;
        instr = 32'h100A00B;
        npc = 32'h1000123A;
        #10;
        instr = 32'h110006BC;
        npc = 32'h100BCF;
        #10;
        $finish;
    end
endmodule
