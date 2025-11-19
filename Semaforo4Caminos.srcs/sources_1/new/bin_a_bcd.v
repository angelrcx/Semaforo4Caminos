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
    input [5:0] bin_in,
    input [5:0] conf_in,
    input set,
    input clk,
    input rst,
    output reg [3:0] bcd_dec,
    output reg [3:0] bcd_unid
    );
    
    always@(posedge clk, negedge rst) begin
        if(!rst)begin
            bcd_dec =0; 
            bcd_unid = 0;
        end
        else if(set) begin
            bcd_dec  = conf_in / 6'd10;
            bcd_unid = conf_in % 6'd10; 
        end
        else begin
            bcd_dec  = bin_in / 6'd10;
            bcd_unid = bin_in % 6'd10;
        end
        
             
    end
    
     
endmodule
