`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2025 08:26:08 PM
// Design Name: 
// Module Name: Semaforo_Top
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


module Semaforo_Top(
    input clk,
    input rst,
    input btn_inc,
    input btn_dec,
    input btn_un,
    input btn_decena,
    input sw_color,
    input btn_listo,
    output [7:0] an,
    output [6:0] seg,
    output [11:0] leds
    );

    wire [1:0] modo;
    wire [3:0] unidades;
    wire [3:0] decenas;
    wire [5:0] tiempo_config;

    ModeIncDec selector_modo (
        .p_btn1(btn_un),
        .p_btn2(btn_decena),
        .rst(rst),
        .clk(clk),
        .out1(modo)
    );

    IncDecDisp contador_unidades (
        .clk(clk),
        .p_btn1(btn_inc),
        .p_btn2(btn_dec),
        .rst(rst),
        .out1(unidades)
    );

    IncDecDisp contador_decenas (
        .clk(clk),
        .p_btn1(btn_inc),
        .p_btn2(btn_dec),
        .rst(rst),
        .out1(decenas)
    );

    assign tiempo_config = (modo == 2'b00) ? {2'b00, unidades} : {2'b00, decenas};

    Memoria memoria_tiempos (
        .clk(clk),
        .data_in(tiempo_config),
        .addr_in(sw_color ? 2'b01 : 2'b00),
        .cs(1'b1),
        .read(1'b0),
        .write(btn_listo),
        .reset(rst),
        .data_out(tiempo_actual)
    );

    wire [1:0] estado_semaforo;

    Contador contador_principal (
        .data_in(tiempo_actual),
        .clk(clk),
        .rst(rst),
        .data_out(tiempo_restante)
    );

    MaquinaEdos maquina_estados (
        .rst(rst),
        .clk(clk),
        .start(tiempo_restante == 0),
        .contador(tiempo_restante),
        .address(estado_semaforo)
    );

    wire clk_2hz;

    DivisorFrecuencia #( .lim(25000000) ) div_2hz (
        .clk(clk),
        .rst(rst),
        .clkout(clk_2hz)
    );

    wire lv, la, lr;

    Semaforo semaforo_principal (
        .clk(clk_2hz),
        .rst(rst),
        .Estado(estado_semaforo),
        .LedVerde(lv),
        .LedAmarillo(la),
        .LedRojo(lr)
    );

    assign leds[0] = lv;
    assign leds[1] = la;
    assign leds[2] = lr;

    wire [3:0] bcd_dec_out, bcd_unid_out;

    bin_a_bcd conversor_bcd (
        .bin_in(tiempo_restante),
        .conf_in(tiempo_config),
        .set(btn_listo),
        .clk(clk),
        .rst(rst),
        .bcd_dec(bcd_dec_out),
        .bcd_unid(bcd_unid_out)
    );

    wire [6:0] seg_dec, seg_unid, seg_color;

    Deco7SEG deco_dec (
        .in1(bcd_dec_out),
        .Out7seg(seg_dec)
    );

    Deco7SEG deco_unid (
        .in1(bcd_unid_out),
        .Out7seg(seg_unid)
    );

    DisColor display_color (
        .Estado(sw_color ? 2'b01 : 2'b00),
        .Segmentos_Color(seg_color)
    );

    reg [2:0] display_sel = 0;
    always @(posedge clk) begin
        display_sel <= display_sel + 1;
    end

    always @(*) begin
        case(display_sel)
            3'b000: begin an = 8'b11111110; seg = seg_unid; end
            3'b001: begin an = 8'b11111101; seg = seg_dec; end
            3'b010: begin an = 8'b11111011; seg = seg_color; end
            default: begin an = 8'b11111111; seg = 7'b1111111; end
        endcase
    end

endmodule
