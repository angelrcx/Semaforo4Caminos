`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2025 07:48:38 PM
// Design Name: 
// Module Name: ModoUniDece
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


module ModoUniDece(
    input p_btn1,
    input p_btn2,
    input rst,
    input clk,
    output [1:0] out1
    );
    reg [1:0] registro = 0;
    always@(posedge clk, negedge rst)
    begin
        if(!rst) 
            registro = 0;
        
        if(p_btn1)
        begin
            registro = 2'b00;
        end
        if(p_btn2)
        begin
            registro = 2'b01;
        end
    end
    assign out1 = registro;
endmodule
