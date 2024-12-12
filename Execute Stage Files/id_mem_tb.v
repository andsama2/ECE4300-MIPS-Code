`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 06:47:08 PM
// Design Name: 
// Module Name: id_mem_tb
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


module id_mem_tb(

    );
    reg [1:0] ctlwb_out;
    reg [2:0] ctlm_out;
    reg [31:0] adder_out, aluout, readdat2;
    reg aluzero;
    reg [4:0] muxout;
    wire [1:0] wb_ctlout;
    wire [2:0] m_ctlout;
    wire [31:0] add_result, alu_result, rdata2out;
    wire zero;
    wire [4:0] five_bit_muxout;
    reg clk, reset;
    
    ID_MEM uut (
        .ctlwb_out(ctlwb_out),
        .ctlm_out(ctlm_out),
        .adder_out(adder_out),
        .aluout(aluout),
        .readdat2(readdat2),
        .aluzero(aluzero),
        .muxout(muxout),
        .wb_ctlout(wb_ctlout),
        .m_ctlout(m_ctlout),
        .add_result(add_result),
        .alu_result(alu_result),
        .rdata2out(rdata2out),
        .zero(zero),
        .five_bit_muxout(five_bit_muxout),
        .clk(clk),
        .reset(reset)
    );
    
    parameter T = 10;
    always begin
        clk = 1'B0;
        #(T/5);
        clk = 1'b1;
        #(T/5);
    end
    initial begin
        reset = 0;
        ctlwb_out = 2'b10;
        ctlm_out = 3'b111;
        adder_out = 32'b001100;
        aluout = 32'b001111;
        aluzero = 0;
        readdat2 = 32'b001010;
        muxout = 5'b11111;
        #(T);
        $finish;
    end
endmodule
