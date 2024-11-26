`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 07:59:52 PM
// Design Name: 
// Module Name: PIPELINE
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


module PIPELINE(
    input [4:0] rd, // writereg, from MEM/WB
    input [31:0] writedata, // writedata, from MEM/WB
    input EX_MEM_PCSrc,
    input [31:0] EX_MEM_NPC,
    output [1:0] wb_ctlout,
    output [2:0] m_ctlout,
    output [3:0] ex_ctlout,
    output [31:0] npcout, rdata1out, rdata2out, s_extendout,
    output [4:0] instrout_1511, instrout_2016,
    input clk, reset
    );
    
    // wires
    wire [31:0] IF_ID_instr;
    wire [31:0] IF_ID_NPC;
    
    I_DECODE i_decode (
        .IF_ID_instr(IF_ID_instr[31:0]),
        .IF_ID_NPC(IF_ID_NPC[31:0]),
        .writedata(writedata),
        .rd(rd),
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
    
    I_FETCH i_fetch (
        .IF_ID_instr(IF_ID_instr),
        .IF_ID_npc(IF_ID_NPC),
        .EX_MEM_PCSrc(EX_MEM_PCSrc),
        .EX_MEM_NPC(EX_MEM_NPC),
        .clk(clk)
    );
endmodule
