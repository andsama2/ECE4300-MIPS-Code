`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 02:39:28 PM
// Design Name: 
// Module Name: ALU_MAX
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


module ALU_MAX(
    input [31:0] a, b, // mux input
    input [31:0] A, // ALU input
    // output [31:0] y,
    input sel,
    output reg zero,
    output reg [31:0] result,
    input [2:0] control
    );
    
    mux alu_mux (
    .a(a),
    .b(b),
    .y(y),
    .sel(sel)
    );
    
    wire [31:0] y;
    
    // ALU Parameters
    parameter [2:0] AND = 3'b000;
    parameter [2:0] OR = 3'b001;
    parameter [2:0] add = 3'b010;
    parameter [2:0] sub = 3'b110;
    parameter [2:0] slt = 3'b111;
    
    always @(control)
    begin
        zero = 1'b0;
        result = 32'b0;
        
        case(control)
            AND: begin 
                result = A && y;
                zero = 0;
            end
            OR: begin
                result = A || y;
                zero = 0;
            end
            add: begin 
                result = A + y;
                zero = 0;
            end    
            sub: begin
              result = A - y;
              zero = 0;
            end
            slt: begin
                result = A - y;
                if (result < 0)
                    zero = 1;
                else
                    zero = 0;    
            end
         endcase   
    end
    
    
endmodule
