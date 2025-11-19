`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2025 11:59:38 AM
// Design Name: 
// Module Name: Leds
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


module Leds(
    input clk,
    input rst,
    input InColor,
    input [1:0] Estado,
    input mode,
    output reg LedVerde,
    output reg LedAmarillo,
    output reg LedRojo
    );
    
    always @(*) begin
        LedVerde = 1'b0;
        LedAmarillo = 1'b0;
        LedRojo = 1'b0;
        
        if(mode) begin
            case (InColor)
            0: LedVerde = 1'b1;
            1: LedAmarillo = 1'b1;
            endcase
        end
        else begin
            case (Estado)
                    2'b00: LedVerde = 1'b1;
                    2'b01: begin
                        if(clk)
                        LedAmarillo = 1'b1;
                    end
                    2'b10: LedRojo = 1'b1;
                    default: LedRojo = 1'b1;
                endcase
        end

            
    end
endmodule
