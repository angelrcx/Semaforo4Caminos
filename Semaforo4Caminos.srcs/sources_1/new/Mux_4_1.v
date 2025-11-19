`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 10:42:54 AM
// Design Name: 
// Module Name: Mux_4_1
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


module mux_4_1 #(parameter m = 4) (
    input [m-1:0] in0,in1,in2,in3,
    input [1:0] sel,
    output reg [m-1:0] out1
    );

    always@(*)
    begin
        case(sel)
            2'b00: out1 = in0;
            2'b01: out1 = in1;
            2'b10: out1 = in2;
        endcase
    end

endmodule
