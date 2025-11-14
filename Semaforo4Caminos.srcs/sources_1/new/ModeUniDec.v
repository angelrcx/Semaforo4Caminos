`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2025 07:28:43 PM
// Design Name: 
// Module Name: ModeUniDec
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


module ModeUniDec(
    input p_btn1,
    input p_btn2,
    input rst,
    input clk,
    output [1:0] out1
    );
    reg [1:0] registro = 0;
    always@(posedge clk, negedge rst)
    begin
        if(rst) 
            registro = 0;
        
        if(p_btn1)
        begin
            registro = 2'b01;
        end
        if(p_btn2)
        begin
            registro = 2'b00;
        end
    end
    assign out1 = registro;
endmodule