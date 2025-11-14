`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2025 10:50:18
// Design Name: 
// Module Name: Memoria
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


module Memoria(
    input clk,
    input [5:0] data_in,
    input [1:0] addr_in, 
    input cs,
    input rw,
    input reset,
    output reg [5:0] data_out
    );
    
    reg [5:0] reg_verde;
    reg [5:0] reg_amarillo;
    reg [5:0] reg_rojo;

always @(posedge clk or posedge reset) begin
        if (reset) begin
            reg_verde    = 6'd10;
            reg_amarillo = 6'd5;
            reg_rojo     = (reg_verde + reg_amarillo) * 3;
            data_out     = 6'd0;
        end 
        else begin
            if (cs) begin
                
                if (rw==0) begin
                    case (addr_in)
                        2'b00: begin
                            reg_verde = data_in;
                            reg_rojo  = (data_in + reg_amarillo)*3;
                        end
                        2'b01: begin
                            reg_amarillo = data_in;
                            reg_rojo     = (reg_verde + data_in)*3;
                        end
                    endcase
                end 
                else begin
                    case (addr_in)
                        2'b00: data_out = reg_verde;
                        2'b01: data_out = reg_amarillo;
                        2'b10: data_out = reg_rojo;
                        default: data_out = 6'd0;
                    endcase
                end
            end
        end
    end

endmodule
