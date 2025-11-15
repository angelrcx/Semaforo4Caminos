`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2025 07:45:52 PM
// Design Name: 
// Module Name: IncrementaDecrementa
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


module IncrementaDecrementa(
    input clk,
    input p_btn1,
    input p_btn2, 
    input rst,
    output [3:0] out1
    );
    reg [3:0] registro = 0;
    always@(posedge clk, negedge rst)
    begin
        if(!rst)
            registro <= 0;
        else begin
            
            if(p_btn1) begin
                if(registro == 9)
                    registro <= 0;
                else
                    registro <= registro + 1;
            end
    
            else if(p_btn2) begin
                if(registro == 0)
                    registro <= 9;
                else
                    registro <= registro - 1;
            end
    
        end
    end
    assign out1 = registro;
endmodule
