`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 12:59:02 PM
// Design Name: 
// Module Name: ID_EX_tb
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


module ID_EX_tb(

    );
    reg [1:0] ctlwb_out;
    reg [2:0] ctlm_out;
    reg [3:0] ctlex_out;
    reg [31:0] npc, readdat1, readdat2, signext_out;
    reg [4:0] instr_1511, instr_2016;
    wire [1:0] wb_ctlout;
    wire [2:0] m_ctlout;
    wire [3:0] ex_ctlout;
    wire [31:0] npcout, rdata1out, rdata2out, s_extendout;
    wire [4:0] instrout_1511, instrout_2016;
    reg clk, reset;
    
    ID_EX uut (
        .ctlwb_out(ctlwb_out),
        .ctlm_out(ctlm_out),
        .ctlex_out(ctlex_out),
        .npc(npc),
        .readdat1(readdat1),
        .readdat2(readdat2),
        .signext_out(signext_out),
        .instr_1511(instr_1511),
        .instr_2016(instr_2016),
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
        ctlwb_out = 2'b01;
        ctlm_out = 3'b010; 
        ctlex_out = 4'b1100;
        npc = 32'h002A0A45;
        readdat1 = 32'h0000A000;
        readdat2 = 32'h00000440;
        signext_out = 32'h0000000F;
        instr_1511 = 5'b00111;
        instr_2016 = 5'b10010;
        #(T);
        ctlwb_out = 2'b10;
        ctlm_out = 3'b111;
        ctlex_out = 4'b1011;
        #(T);
        npc = 32'h00AA0AB0;
        #(T/2);
        readdat1 = 32'h000FC865;
        readdat2 = 32'h00A29BF1;
        signext_out = 32'h000000AA;
        #(T/2);
        instr_1511 = 5'b10111;
        instr_2016 = 5'b10101;
        #(T/2);
        $finish;
    end
endmodule
