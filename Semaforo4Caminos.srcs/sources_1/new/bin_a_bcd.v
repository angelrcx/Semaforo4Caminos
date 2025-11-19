`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2025 09:34:20 PM
// Design Name: 
// Module Name: bin_a_bcd
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


module bin_a_bcd(
    input [6:0] bin_in,
    output [3:0] bcd_dec,
    output [3:0] bcd_unid
    );
    assign bcd_dec  = bin_in / 10;
    assign bcd_unid = bin_in % 10;
endmodule
