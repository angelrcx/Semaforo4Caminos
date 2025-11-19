`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2025 11:04:27 PM
// Design Name: 
// Module Name: DivisorFrecuencia
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


module DivisorFrecuencia #(parameter lim = 50000000)(
    input clk, rst,
    output reg clkout
    );
    reg [25:0] registro = 0;
    always@(posedge clk, negedge rst) begin
    begin
        if(rst) begin
            clkout = 0; 
            registro = 0;
        end
        else if(registro == lim) begin
            registro = 0;
            clkout = ~clkout;
        end
        else
            registro = registro + 1;
        end
    end
endmodule
