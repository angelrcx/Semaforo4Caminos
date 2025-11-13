`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2025 09:59:21 AM
// Design Name: 
// Module Name: Memory
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


module Memory(
    input clk,
    input [5:0] data_in,
    input [2:0] addr_in,
    input c_sel,
    input rw,
    output reg [6:0] data_out
    );
    
    always@(posedge clk)
    begin
        if(c_sel)
         begin
            if(rw)
             begin
             end
                
                
             end
         end
    
endmodule
