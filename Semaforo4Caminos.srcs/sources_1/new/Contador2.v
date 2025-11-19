`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 10:40:31 AM
// Design Name: 
// Module Name: Contador2
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


module Contador2(// #(parameter lim = 50000)(

    input clk,rst,
    output [1:0] out1
    );
    reg[1:0] registro = 0;

    always@(posedge clk, negedge rst)
    begin 
        if(rst)
        begin
             registro = 0;
        end
        else
            registro = registro + 1;
    end
    assign out1 = registro;

endmodule

