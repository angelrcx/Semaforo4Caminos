`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2025 11:21:31 AM
// Design Name: 
// Module Name: Conversor
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


module Conversor(
    input [3:0]datBin,
    input [1:0]Mode,
    input Set,
    output reg [5:0]datDec
    );
    reg [5:0] calculated_value;
    always @(*) begin
        if (Set) begin
            if(Mode == 2'b00) begin
                calculated_value = datBin;
            end
            if(Mode == 2'b01) begin
                calculated_value = calculated_value + ((datBin*8) + (datBin*2));
            end
        end else begin
                datDec = calculated_value[5:0];  
        end
    end
endmodule
