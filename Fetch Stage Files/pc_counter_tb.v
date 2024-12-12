`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 07:40:33 PM
// Design Name: 
// Module Name: pc_counter_tb
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


module pc_counter_tb(

    );
    
    wire [31:0] PC;
    reg [31:0] npc;
    reg clk;
    
    pc_counter uut (
        .PC(PC),
        .npc(npc),
        .clk(clk)
    );
    
    always begin
        clk = 1'b0;
        #5;
        clk = 1'b1;
        #5;
    end
    initial begin
        npc = 32'h00000000;
        #10 
        npc = 32'h00000007;
        #10 
        npc = 32'h0000000A;
        #10 
        npc = 32'h0000000D;
        #10 
        npc = 32'h0000001A;
        #10
        $finish;
    end
    
    initial begin
        $monitor("Time = %0d, clk = %b, npc = %h, PC = %h", $time, clk, npc, PC);
    end
endmodule
