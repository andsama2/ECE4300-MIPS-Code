`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 03:42:41 PM
// Design Name: 
// Module Name: alu_control_tb
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


module alu_control_tb(

    );
    
    reg [5:0] funct;
    reg [1:0] alu_op;
    wire [2:0] select;
    
    ALU_CONTROL uut (
        .funct(funct),
        .alu_op(alu_op),
        .select(select)
    );
    
    parameter T = 5;
    initial begin
        funct = 6'b000000;
        alu_op = 2'b00;
        #(T);
        alu_op = 2'b01;
        #(T);
        alu_op = 2'b10;
        funct = 6'b100000;
        #(T);
        funct = 6'b100010;
        #(T);
        funct = 6'b100100;
        #(T);
        funct = 6'b100101;
        #(T);
        funct = 6'b101010;
        #(T);
        $finish;
    end
endmodule
