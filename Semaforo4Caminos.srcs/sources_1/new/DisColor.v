`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2025 09:04:05 AM
// Design Name: 
// Module Name: DisColor
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


module DisColor(
    input [1:0] Estado ,
    output reg [6:0] Segmentos_Color  
    );
    
always @(*) begin
    case (Estado)
        2'b00: Segmentos_Color = 7'b1100011; 
        2'b01: Segmentos_Color = 7'b0001000; 
        2'b10: Segmentos_Color = 7'b1111011;
        default: Segmentos_Color = 7'b1111111;
    endcase
end
endmodule
