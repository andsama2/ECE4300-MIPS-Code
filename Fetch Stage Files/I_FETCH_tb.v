`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 12:25:58 AM
// Design Name: 
// Module Name: I_FETCH_tb
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


module I_FETCH_tb(

    );
    reg clk;
    wire [31:0] IF_ID_instr, IF_ID_npc;
    reg EX_MEM_PCSrc;
    reg [31:0] EX_MEM_NPC;
    
    I_FETCH uut (
        .clk(clk),
        .IF_ID_instr(IF_ID_instr),
        .IF_ID_npc(IF_ID_npc),
        .EX_MEM_PCSrc(EX_MEM_PCSrc),
        .EX_MEM_NPC(EX_MEM_NPC)
    );
    
     always begin
        clk = 1'b0;
        #10;
        clk = 1'b1;
        #10;
    end
    initial begin
        EX_MEM_PCSrc = 0;
        EX_MEM_NPC = 32'h00000004;  
        #10; 
        EX_MEM_PCSrc = 0; 
        #10; 
        EX_MEM_PCSrc = 1;  
        EX_MEM_NPC = 32'h00000008; 
        #10; 
        EX_MEM_PCSrc = 0;  
        #10; 
        EX_MEM_PCSrc = 1;  
        EX_MEM_NPC = 32'h0000000C;  
        #60; 
        $finish;
    end
    
    initial begin
        $display("Time\tPCSrc\tEX_MEM_NPC\tIF_ID_instr\tIF_ID_npc");
        $monitor("%0t\t%b\t%h\t%h\t%h", $time, EX_MEM_PCSrc, EX_MEM_NPC, IF_ID_instr, IF_ID_npc);
    end
endmodule
