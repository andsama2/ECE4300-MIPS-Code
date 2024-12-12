`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 12:40:31 PM
// Design Name: 
// Module Name: S_EXTEND_tb
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


module S_EXTEND_tb(

    );
    reg [15:0] IF_ID_instr;
    wire [31:0] IF_ID_instr_ext;
    
    S_EXTEND uut (
        .IF_ID_instr(IF_ID_instr),
        .IF_ID_instr_ext(IF_ID_instr_ext)
    );
    
    initial begin
        IF_ID_instr = 15'h0F;   
        #10;
        IF_ID_instr = 15'hA00;
        #10;
        $finish; 
    end
endmodule
