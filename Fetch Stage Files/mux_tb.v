`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 06:50:20 PM
// Design Name: 
// Module Name: mux_tb
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


module mux_tb(

    );
    wire [31:0] y;
    reg [31:0] a, b;
    reg sel;
    
    mux uut (
        .y(y),
        .a(a),
        .b(b),
        .sel(sel)
    );
    
    initial begin
        a = 32'b1100;
        b = 32'b0011;
        sel = 0;
        #10
        sel = 1;
        #10
        $finish;
    end
endmodule
