`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 11:15:24 AM
// Design Name: 
// Module Name: mux_wb
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


module mux_wb(
    output wire [31:0] wb_data,
    input wire [31:0] mem_read_data, mem_ALU_result,
    input wire memtoreg
    );
    
    mux wb_mux (
    .a(mem_read_data),
    .b(mem_ALU_result),
    .y(wb_data),
    .sel(memtoreg)
    );
endmodule
