`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2024 11:29:59 AM
// Design Name: 
// Module Name: memory
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


module memory(
    input clk,
    output reg [31:0] data,
    input wire [31:0] addr
    );
    
 // Register Declaration
    reg [31:0]  MEM[0:127];
    initial begin
    
    MEM[0] <= 'h002300AA;
    MEM[1] <= 'h10654321;
    MEM[2] <= 'h00100022;
    MEM[3] <= 'h8C123456;
    MEM[4] <= 'h8F123456;
    MEM[5] <= 'hAD654321;
    MEM[6] <= 'h13012345;
    MEM[7] <= 'hAC654321;
    MEM[8] <= 'h12012345;
    MEM[9] <= 'h90000099;
    end
    
    always @ (posedge clk) data <= MEM[addr];
    
    integer i;
    initial begin
        $readmemb("risc.txt", MEM);
        for (i = 0; i < 24; i = i + 1)
            $display(MEM[i]);
    end
endmodule
