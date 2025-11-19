`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 11:03:38 AM
// Design Name: 
// Module Name: DecoBCDa7SEG
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


module DecoBCDa7SEG(
    input [3:0]in1,
    output [6:0]Out7seg
    );

    reg [6:0] Out;

    always@(*)
    begin
        case(in1)
            4'b0000 : Out = 7'b1111110;
            4'b0001 : Out = 7'b0110000;
            4'b0010 : Out = 7'b1101101;
            4'b0011 : Out = 7'b1111001;
            4'b0100 : Out = 7'b0110011;
            4'b0101 : Out = 7'b1011011;
            4'b0110 : Out = 7'b1011111;
            4'b0111 : Out = 7'b1110000;
            4'b1000 : Out = 7'b1111111;
            4'b1001 : Out = 7'b1111011;
            default : Out = 7'b0000000;
        endcase
    end
    assign Out7seg = ~Out;
endmodule
