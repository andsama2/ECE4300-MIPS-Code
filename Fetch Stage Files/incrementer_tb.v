`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 09:14:49 PM
// Design Name: 
// Module Name: incrementer_tb
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


module incrementer_tb(

    );
    
    reg [31:0] PC; 
    wire [31:0] Next_PC;
    
    incrementer uut (
        .PC(PC),
        .Next_PC(Next_PC)    
    );
    
    initial begin
        PC = 1;
        #10;
        PC = 10;
        #10; 
        PC = 22;
        #10;
        PC = 56;
        #10;
        $finish;
    end
    
    always @(PC)
    #1 $display ("Time = %0d, PC = %0d, Next_PC = %0d", $time, PC, Next_PC);
endmodule
