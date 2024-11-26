`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 03:25:11 PM
// Design Name: 
// Module Name: ID_EX
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


module ID_EX( // finish the inputs and outputs later
    input wire [1:0] ctlwb_out,
    input wire [2:0] ctlm_out,
    input wire [3:0] ctlex_out,
    input wire [31:0] npc,readdat1, readdat2, signext_out,
    input wire [4:0] instr_1511, instr_2016,
    output reg [1:0] wb_ctlout,
    output reg [2:0] m_ctlout,
    output reg [3:0] ex_ctlout,
    output reg [31:0] npcout, rdata1out, rdata2out, s_extendout,
    output reg [4:0] instrout_1511, instrout_2016,
    input clk, reset
    );
    
    initial begin // initialize everything to 0
        wb_ctlout = 0;
        m_ctlout = 0;
        ex_ctlout = 0;
        npcout = 0;
        rdata1out = 0;
        rdata2out = 0;
        s_extendout = 0;
        instrout_1511 = 0;
        instrout_2016 = 0;
     end
     
     always @(posedge clk || reset)
     begin
        if(reset)
        begin // reset reg back to 0, <=
            wb_ctlout <= 0; // continue with the rest
            m_ctlout <= 0;
            ex_ctlout <= 0;
            npcout <= 0;
            rdata1out <= 0;
            rdata2out <= 0;
            s_extendout <= 0;
            instrout_1511 <= 0;
            instrout_2016 <= 0;
        end
        else
        begin
            wb_ctlout <= ctlwb_out;
            m_ctlout <= ctlm_out;
            ex_ctlout <= ctlex_out;
            npcout <= npc;
            rdata1out <= readdat1;
            rdata2out <= readdat2;
            s_extendout <= signext_out;
            instrout_2016 <= instr_2016;
            instrout_1511 <= instr_1511;
        end
      end         
endmodule
