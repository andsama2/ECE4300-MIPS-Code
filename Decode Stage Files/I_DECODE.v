`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 06:01:00 PM
// Design Name: 
// Module Name: I_DECODE
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


module I_DECODE(
    input [31:0] IF_ID_instr, IF_ID_NPC,
    input [31:0] writedata,
    input [5:0] rd,
    output [1:0] wb_ctlout,
    output [2:0] m_ctlout,
    output [3:0] ex_ctlout,
    output [31:0] npcout, rdata1out, rdata2out, s_extendout,
    output [4:0] instrout_1511, instrout_2016,
    input clk, reset
    );
    
    // Control Wires
    wire [1:0] WB;
    wire [2:0] M;
    wire [3:0] EX; 
    
    // REG Wires
    wire [31:0] A, B;
    
    // S_EXTEND wires
    wire [31:0] IF_ID_instr_ext;
    
    CONTROL control (
        .opcode(IF_ID_instr[31:26]),
        .WB(WB),
        .M(M),
        .EX(EX)
    );
    
    REG reg_file (
        .rs(IF_ID_instr[25:21]),
        .rd(rd),
        .rt(IF_ID_instr[20:16]),
        .writedata(writedata),
        .regwrite(1),
        .A(A),
        .B(B),
        .clk(clk),
        .reset(reset)
    );
    
    S_EXTEND s_extend (
        .IF_ID_instr(IF_ID_instr[15:0]),
        .IF_ID_instr_ext(IF_ID_instr_ext[31:0])
    );
    
    ID_EX i_d (
        .ctlwb_out(WB),
        .ctlm_out(M),
        .ctlex_out(EX),
        .npc(IF_ID_NPC),
        .readdat1(A),
        .readdat2(B),
        .signext_out(IF_ID_instr_ext[31:0]),
        .instr_1511(IF_ID_instr[15:11]), 
        .instr_2016(IF_ID_instr[20:16]),
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
endmodule
