`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2025 10:07:44 AM
// Design Name: 
// Module Name: Semaforo
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


module Semaforo(
    input clk,
    input rst,
    input [1:0] Estado,
    output reg LedVerde,
    output reg LedAmarillo,
    output reg LedRojo
    );
    
    always @(*) begin
        LedVerde = 1'b0;
        LedAmarillo = 1'b0;
        LedRojo = 1'b0;
        
        case (Estado)
            2'b00: LedVerde = 1'b1;
            2'b01: LedAmarillo = 1'b1 & clk;
            2'b10: LedRojo = 1'b1;
            default: LedRojo = 1'b1;
        endcase
    end
endmodule
