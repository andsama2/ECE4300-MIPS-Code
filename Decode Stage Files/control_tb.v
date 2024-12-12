`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 11:34:00 AM
// Design Name: 
// Module Name: control_tb
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


module control_tb(

    );
    reg [5:0] opcode;
    wire [1:0] WB;
    wire [2:0] M;
    wire [3:0] EX;
    
    CONTROL uut (
        .opcode(opcode),
        .WB(WB),
        .M(M),
        .EX(EX)
    );
    
    parameter T = 10;
    initial begin
        opcode = 6'b000000;
        #(T);
        opcode = 6'b100011;
        #(T);
        opcode = 6'b101011;
        #(T);
        opcode = 6'b000100;
        #(T);
        $finish;
    end
endmodule
