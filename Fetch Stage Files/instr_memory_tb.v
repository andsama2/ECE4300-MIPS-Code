`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 08:56:39 PM
// Design Name: 
// Module Name: instr_memory_tb
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


module instr_memory_tb(

    );
    reg clk;
    wire [31:0] data;
    reg [31:0] addr;
    
    memory uut (
        .clk(clk),
        .data(data),
        .addr(addr)
    );
    
    always begin
        clk = 1'b0;
        #5;
        clk = 1'b1;
        #5;
    end
    initial begin
        addr = 0;
        #10;
        $display("Addr: %h, Data: %h", addr, data);
        
        addr = 2;
        #10;
        $display("Addr: %h, Data: %h", addr, data);
        
        addr = 4;
        #10
        $display("Addr: %h, Data: %h", addr, data);
        
        addr = 6;
        #10
        $display("Addr: %h, Data: %h", addr, data);
        $finish;
    end
endmodule
