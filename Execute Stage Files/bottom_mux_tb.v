`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 06:13:20 PM
// Design Name: 
// Module Name: bottom_mux_tb
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


module bottom_mux_tb(

    );
    
    reg [4:0] a, b;
    reg sel;
    wire [4:0] y;
    
    BOTTOM_MUX uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );
    
    initial begin
        a = 5'b00000;
        b = 5'b11111;
        sel = 0;
        #10
        sel = 1;
        #10
        $finish;
    end
endmodule
