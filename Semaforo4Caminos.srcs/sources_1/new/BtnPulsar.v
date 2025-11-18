`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2025 07:43:18 PM
// Design Name: 
// Module Name: BtnPulsar
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


module BtnPulsar(
    input rst,
    input clk,
    input btn,
    output reg p_btn
    );
    
    reg [1:0] estado;
    always@(posedge clk, negedge rst)
    begin
        if(!rst)
            estado = 0;
        else
        begin
            case(estado)
            0: begin
                if(btn)
                    estado = 1;
                else
                    estado = 0;
            end
            1: estado = 2;
            2: if(!btn)
                estado = 0;
            default: estado = 0;
            endcase
        end
    end
    always@(posedge clk, negedge rst)
    begin
        if(!rst)
            p_btn = 0;
        else
        begin
            case(estado)
            0: begin
                p_btn = 0;
            end
            1: begin
                p_btn = 1;
            end
            2: begin
                p_btn = 0;
            end
            endcase
        end
    end
endmodule
