`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 03:22:40 PM
// Design Name: 
// Module Name: ex_adder_tb
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


module ex_adder_tb(

    );
    reg [31:0] add_in1, add_in2;
    wire [31:0] add_out;
    
    ADDER ex_adder (
        .add_in1(add_in1),
        .add_in2(add_in2),
        .add_out(add_out)
    );
    
    parameter T = 5;
    initial begin
        add_in1 = 32'h00005;
        add_in2 = 32'h00005;
        #(T);
        add_in2 = 32'h0000A;
        #(T);
        add_in1 = 32'h00000;
        #(T);
        $finish;
    end
endmodule
