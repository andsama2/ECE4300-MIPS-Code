`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 03:02:44 AM
// Design Name: 
// Module Name: PIPELINE_tb
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


module PIPELINE_tb(

    );
    reg clk, reset;
    
    PIPELINE uut (
        .clk(clk),
        .reset(reset)
    );
    
    always begin
        clk = 1'b0;
        #5;
        clk = 1'b1;
        #5;
    end
    initial begin
        reset = 0;
        #20;
        reset = 1;
        $finish;
    end
endmodule
