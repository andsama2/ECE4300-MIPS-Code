`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 08:59:43 PM
// Design Name: 
// Module Name: PIPELINE_tb
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


module PIPELINE_tb(

    );
    reg [4:0] rd;
    reg [31:0] writedata;
    reg EX_MEM_PCSrc;
    reg [31:0] EX_MEM_NPC;
    reg clk, reset;
    wire [1:0] wb_ctlout;
    wire [2:0] m_ctlout;
    wire [3:0] ex_ctlout;
    wire[31:0] npcout, rdata1out, rdata2out, s_extendout;
    wire [4:0] instrout_1511, instrout_2016;
    
    PIPELINE uut (
        .rd(rd),
        .writedata(writedata),
        .EX_MEM_PCSrc(EX_MEM_PCSrc),
        .EX_MEM_NPC(EX_MEM_NPC),
        .wb_ctlout(wb_ctlout),
        .m_ctlout(m_ctlout),
        .ex_ctlout(ex_ctlout),
        .npcout(npcout),
        .rdata1out(rdata1out),
        .rdata2out(rdata2out),
        .s_extendout(s_extendout),
        .instrout_1511(instrout_1511),
        .instrout_2016(instrout_2016),
        .clk(clk),
        .reset(reset)
    );
    
    localparam T = 10;
    always
    begin
        clk = 1'b0;
        #(T/5);
        clk = 1'b1;
        #(T/5);
    end
    initial begin
        reset = 1'b0;
        @(negedge clk)
        reset = 1'b1;
        
        EX_MEM_PCSrc = 0;
        EX_MEM_NPC = 0;
        writedata = 0;
        rd = 0;
        #10
        EX_MEM_NPC = 8'h002300AA;
        #5
        EX_MEM_NPC = 8'h10654321;
        #5
        EX_MEM_NPC = 8'h00100022;
        #5
        EX_MEM_NPC = 8'h8C123456;
        #5
        EX_MEM_NPC = 8'h8F123456;
        #5
        EX_MEM_NPC = 8'hAD654321;
        #5
        EX_MEM_NPC = 8'h13012345;
        #5
        EX_MEM_NPC = 8'hAC654321;
        #5
        EX_MEM_NPC = 8'h12012345;
     
    end
    
    always @(EX_MEM_NPC)
    #1 $display("At t = %0d EX_MEM_NPC = %h", $time, EX_MEM_NPC);
    
endmodule
