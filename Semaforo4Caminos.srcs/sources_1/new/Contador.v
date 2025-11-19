`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2025 22:16:27
// Design Name: 
// Module Name: Contador
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


module Contador(
    input [5:0]data_in,
    input clk, rst,
    output [5:0]data_out
    );
    
    reg [5:0] registro = 0;

    always@(posedge clk, negedge rst)
    begin
        if(!rst)
        begin
            registro = data_in;
   
        end
        else if (registro == 0)
        begin
        registro = data_in;
         
        end
        else  
        begin
            registro = registro - 1;
        end
    end
    assign data_out = registro;
endmodule
