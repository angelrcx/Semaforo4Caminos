`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2025 07:51:15 PM
// Design Name: 
// Module Name: ConvertBinDec
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


module ConvertBinDec(
    input [3:0] datBin,
    input [1:0] Mode,
    input Set,
    input clk,
    input rst,
    output reg [5:0] datDec
    );

    reg [5:0] calculated_value;

    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            calculated_value <= 0;
            datDec <= 0;
        end
        else begin
            if(Set) begin
                case(Mode)
                    2'b00:  calculated_value <= datBin;                            // unidades
                    2'b01:  calculated_value <= (datBin * 8) + (datBin * 2);       // decenas
                    default: calculated_value <= 0;
                endcase
            end
            else begin
                datDec <= calculated_value;
            end
        end
    end
endmodule
