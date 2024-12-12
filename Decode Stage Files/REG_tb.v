`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 11:51:11 AM
// Design Name: 
// Module Name: REG_tb
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


module REG_tb(

    );
    reg [4:0] rs, rt, rd;
    reg [31:0] writedata;
    reg regwrite;
    wire [31:0] A, B;
    reg clk, reset;
    
    REG uut (
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .writedata(writedata),
        .regwrite(regwrite),
        .A(A),
        .B(B),
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
        regwrite = 1;
        rd = 5'b00001; // writing into register
        writedata = 32'h000A; 
        #(T);
        rs = 5'b00001; // read from write reg
        regwrite = 0; 
        #(T);
        regwrite = 1;
        rd = 5'b00010;
        writedata = 32'h000B;
        #(T);
        rt = 5'b00010; // read reg 2
        regwrite = 0;
        #(T);
        $finish;
    end
endmodule
