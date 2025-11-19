`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2025 09:34:23 PM
// Design Name: 
// Module Name: MaquinaEdos
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


module MaquinaEdos(
    input rst,
    input clk,
    input start,
    input [5:0] contador,
    output reg [2:0] address
    );
    
    reg [1:0] estado;

    always@(posedge clk, negedge rst)
    begin
        if(!rst)
            estado = 0;
        else if(start)
        begin
            case(estado)
            0: begin
                if(contador == 0)
                    estado = 1;
                else
                    estado = 0;
            end
            1: begin
                if(contador == 0)
                    estado = 2;
                else
                    estado = 1;
            end
            2: begin
                if(contador == 0)
                    estado = 0;
                else
                    estado = 2;
            end
            default: estado = 0;
            endcase
         end 
    end
    always@(posedge clk, posedge rst)
    begin
        if(!rst)
            address = 2'b00;
        else if(start)
        begin
            case(estado)
            0: begin
                address = 2'b00;
            end
            1: begin
                address = 2'b01;
            end
            2: begin
                address = 2'b10;
            end
            endcase
        end
    end
endmodule
