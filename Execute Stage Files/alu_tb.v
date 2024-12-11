`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 05:00:49 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb(

    );
    reg [31:0] a, b;
    reg [31:0] A;
    reg sel;
    wire zero;
    wire [31:0] result;
    reg [2:0] control;
    
    ALU_MAX uut (
        .a(a),
        .b(b),
        .A(A),
        .sel(sel),
        .zero(zero),
        .result(result),
        .control(control)
    );
    
    parameter T = 5;
    initial begin
        a = 32'b1100;
        b = 32'b0011;
        A = 32'b1100;
        sel = 0;
        control = 3'b000;
        #(T);
        sel = 1;
        #(T);
        control = 3'b001;
        sel = 0;
        #(T);
        sel = 1;
        control = 3'b010;
        #(T);
        control = 3'b110;
        #(T);
        A = 32'b0000;
        sel = 0;
        control = 3'b111;
        #(T);
        sel = 1;
        #(T);
        $finish;
    end
endmodule
