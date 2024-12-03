`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2024 06:39:34 PM
// Design Name: 
// Module Name: PIPELINE_EX_tb
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


module PIPELINE_EX_tb(

    );
    reg [4:0] rd;
    reg [31:0] writedata;
    reg EX_MEM_PCSrc;
    reg [31:0] EX_MEM_NPC;
    wire [1:0] wb_ctlout_ex;
    wire [2:0] m_ctlout_ex;
    wire [31:0] rdata2out_ex;
    wire [4:0] five_bit_muxout;
    wire [31:0] alu_result, add_result;
    wire zero;
    reg clk, reset;
    
    PIPELINE uut (
        .rd(rd),
        .writedata(writedata),
        .EX_MEM_PCSrc(EX_MEM_PCSrc),
        .EX_MEM_NPC(EX_MEM_NPC),
        .wb_ctlout_ex(wb_ctlout_ex),
        .m_ctlout_ex(m_ctlout_ex),
        .rdata2out_ex(rdata2out_ex),
        .five_bit_muxout(five_bit_muxout),
        .alu_result(alu_result),
        .add_result(add_result),
        .zero(zero),
        .clk(clk),
        .reset(reset)
    );
    
        parameter T = 10;
    always
    begin
        clk = 1'b0;
        #(T/5);
        clk = 1'b1;
        #(T/5);
    end    
    initial begin
        EX_MEM_NPC = 32'h002300AA;
        #(T/2);
        EX_MEM_NPC = 32'h10654321;
        #(T/2);
        EX_MEM_NPC = 32'h00100022;
        #(T/2);
        EX_MEM_NPC = 32'h8C123456;
        #(T/2);
        EX_MEM_NPC = 32'h8F123456;
        #(T/2);
        EX_MEM_NPC = 32'hAD654321;
        #(T/2);
        EX_MEM_NPC = 32'h13012345;
        #(T/2);
        EX_MEM_NPC = 32'hAC654321;
        #(T/2);
        EX_MEM_NPC = 32'h12012345;
        $finish;
    end
endmodule
