`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 01:26:10 AM
// Design Name: 
// Module Name: I_DECODE_tb
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


module I_DECODE_tb(

    );
    reg [31:0] IF_ID_instr, IF_ID_NPC;
    reg [31:0] writedata;
    reg [4:0] rd;
    reg regwrite;
    wire [1:0] wb_ctlout;
    wire [2:0] m_ctlout;
    wire [3:0] ex_ctlout;
    wire [31:0] npcout, rdata1out, rdata2out, s_extendout;
    wire [4:0] instrout_1511, instrout_2016;
    reg clk, reset;
    
    I_DECODE uut (
        .IF_ID_instr(IF_ID_instr),
        .IF_ID_NPC(IF_ID_NPC),
        .writedata(writedata),
        .rd(rd),
        .regwrite(regwrite),
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
    
    parameter T = 10;
    always begin
        clk = 1'b0;
        #(T/5);
        clk = 1'b1;
        #(T/5);
    end
    initial begin
        reset = 0;
        IF_ID_instr = 32'h36E8B6C; // 000000 Opcode 11011 readreg1 01110 readreg2/instr2015 1000101101101100 s_extendout
        IF_ID_NPC = 32'h000ABC;
        rd = 5'b11011; // write register address
        writedata = 32'b1100; 
        regwrite = 0;
        #(T/2);
        regwrite = 1; // enable write
        #(T/2);
        regwrite = 0;
        rd = 5'b01110;
        writedata = 32'b1110;
        #(T/2);
        regwrite = 1;
         #(T);
         regwrite = 0;
         IF_ID_instr = 32'h8F6E8B6C; // testing control opcode: lw
         #(T);
         IF_ID_instr = 32'hAF6E8B6C; // sw
         #(T);
         IF_ID_instr=  32'h136E8B6C; // beq
         #(T);
        $finish;
    end
endmodule
