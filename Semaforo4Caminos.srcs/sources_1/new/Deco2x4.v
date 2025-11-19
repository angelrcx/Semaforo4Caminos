`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 10:41:55 AM
// Design Name: 
// Module Name: Deco2x4
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


module Deco2x4(
    input [1:0]in1,
    output reg [3:0]out1
    );

    always@(*)
    begin
        case (in1)
            2'b00: out1= 4'b1110;
            2'b01: out1= 4'b1101;
            2'b10: out1= 4'b1011;
            endcase
    end
endmodule
