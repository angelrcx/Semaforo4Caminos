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
    output reg [7:0] an,
    output reg [6:0] seg,
    output [11:0] leds
    );

    wire [1:0] modo;
    wire [3:0] unidades;
    wire [3:0] decenas;
    wire [5:0] tiempo_config;
    wire [5:0] tiempo_actual;
    wire [5:0] tiempo_restante;

    wire p_btn_inc, p_btn_dec, p_btn_un, p_btn_decena, p_btn_listo;

    BtnPulsar debounce_inc (.rst(rst), .clk(clk), .btn(btn_inc), .p_btn(p_btn_inc));
    BtnPulsar debounce_dec (.rst(rst), .clk(clk), .btn(btn_dec), .p_btn(p_btn_dec));
    BtnPulsar debounce_un (.rst(rst), .clk(clk), .btn(btn_un), .p_btn(p_btn_un));
    BtnPulsar debounce_decena (.rst(rst), .clk(clk), .btn(btn_decena), .p_btn(p_btn_decena));
    BtnPulsar debounce_listo (.rst(rst), .clk(clk), .btn(btn_listo), .p_btn(p_btn_listo));

    ModeIncDec selector_modo (
        .p_btn1(p_btn_un),
        .p_btn2(p_btn_decena),
        .rst(rst),
        .clk(clk),
        .out1(modo)
    );

    IncDecDisp contador_unidades (
        .clk(clk),
        .p_btn1(modo == 2'b00 ? p_btn_inc : 1'b0),
        .p_btn2(modo == 2'b00 ? p_btn_dec : 1'b0),
        .rst(rst),
        .out1(unidades)
    );

    IncDecDisp contador_decenas (
        .clk(clk),
        .p_btn1(modo == 2'b01 ? p_btn_inc : 1'b0),
        .p_btn2(modo == 2'b01 ? p_btn_dec : 1'b0),
        .rst(rst),
        .out1(decenas)
    );

    assign tiempo_config = decenas * 10 + unidades;

    reg modo_ejecucion = 0;
    always @(posedge clk, negedge rst) begin
        if (!rst)
            modo_ejecucion <= 0;
        else if (p_btn_listo)
            modo_ejecucion <= 1;
    end

    Memoria memoria_tiempos (
        .clk(clk),
        .data_in(tiempo_config),
        .addr_in(modo_ejecucion ? estado_semaforo : (sw_color ? 2'b01 : 2'b00)),
        .cs(1'b1),
        .read(modo_ejecucion),
        .write(~modo_ejecucion & p_btn_listo),
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
        .set(~modo_ejecucion),
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
