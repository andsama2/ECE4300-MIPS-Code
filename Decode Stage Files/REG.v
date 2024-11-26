`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 09:16:13 PM
// Design Name: 
// Module Name: REG
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


module REG(
    input wire [4:0] rs, rt, rd, //[25:21] IF_instr, [20:16] IF_instr ; if regwrite is on, update rd location w/ writedata ; assign A the value at rs, assign B the value at rt
    input [31:0] writedata,
    input regwrite,
    output reg [31:0] A, B, // contents of registers rs, rt
    input clk, reset
    );
     
    // Register Declaration
    reg [31:0] registers[0:31]; // REGISTERS[0:31] is the name
    integer i;
    
    always @(*)
    begin
        A = registers[rs];
        B = registers[rd];
    end
    
    always @(posedge clk || reset)
    begin
        if (reset) 
        begin
            for (i = 0; i < 32; i = i + 1)
                registers[i] = 0;
        end
        if (rd != 0 && regwrite)
            registers[rd] <= writedata;
    end
     
endmodule
