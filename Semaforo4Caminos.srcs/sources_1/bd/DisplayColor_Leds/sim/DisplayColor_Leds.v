//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Wed Nov 19 13:08:51 2025
//Host        : MSI running 64-bit major release  (build 9200)
//Command     : generate_target DisplayColor_Leds.bd
//Design      : DisplayColor_Leds
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "DisplayColor_Leds,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=DisplayColor_Leds,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=18,numReposBlks=18,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=18,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "DisplayColor_Leds.hwdef" *) 
module DisplayColor_Leds
   (LedAmarillo_0,
    LedRojo_0,
    LedVerde_0,
    Out7seg_0,
    Out7seg_1,
    Segmentos_Color_0,
    Set_0,
    addr_in2_0,
    btn_0,
    btn_1,
    btn_2,
    btn_3,
    btn_4,
    clk_0,
    rst_0);
  output LedAmarillo_0;
  output LedRojo_0;
  output LedVerde_0;
  output [6:0]Out7seg_0;
  output [6:0]Out7seg_1;
  output [6:0]Segmentos_Color_0;
  input Set_0;
  input addr_in2_0;
  input btn_0;
  input btn_1;
  input btn_2;
  input btn_3;
  input btn_4;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET rst_0, CLK_DOMAIN DisplayColor_Leds_clk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst_0;

  wire BtnPulsar_0_p_btn;
  wire BtnPulsar_1_p_btn;
  wire BtnPulsar_2_p_btn;
  wire BtnPulsar_3_p_btn;
  wire BtnPulsar_4_p_btn;
  wire [5:0]Contador_0_data_out;
  wire [5:0]Conversor_0_datDec;
  wire [6:0]DecoBCDa7SEG_0_Out7seg;
  wire [6:0]DecoBCDa7SEG_1_Out7seg;
  wire [6:0]DisColor_0_Segmentos_Color;
  wire Div_frecuencia_0_clkout;
  wire DivisorFrecuencia_0_clkout;
  wire [3:0]IncDecDisp_0_out1;
  wire Leds_0_LedAmarillo;
  wire Leds_0_LedRojo;
  wire Leds_0_LedVerde;
  wire [1:0]MaquinaEdos_0_address;
  wire [5:0]Memoria_1_data_out;
  wire [1:0]ModeIncDec_0_out1;
  wire Set_0_1;
  wire addr_in2_0_1;
  wire [3:0]bin_a_bcd_0_bcd_dec;
  wire [3:0]bin_a_bcd_0_bcd_unid;
  wire btn_0_1;
  wire btn_1_1;
  wire btn_2_1;
  wire btn_3_1;
  wire btn_4_1;
  wire clk_0_1;
  wire rst_0_1;

  assign LedAmarillo_0 = Leds_0_LedAmarillo;
  assign LedRojo_0 = Leds_0_LedRojo;
  assign LedVerde_0 = Leds_0_LedVerde;
  assign Out7seg_0[6:0] = DecoBCDa7SEG_0_Out7seg;
  assign Out7seg_1[6:0] = DecoBCDa7SEG_1_Out7seg;
  assign Segmentos_Color_0[6:0] = DisColor_0_Segmentos_Color;
  assign Set_0_1 = Set_0;
  assign addr_in2_0_1 = addr_in2_0;
  assign btn_0_1 = btn_0;
  assign btn_1_1 = btn_1;
  assign btn_2_1 = btn_2;
  assign btn_3_1 = btn_3;
  assign btn_4_1 = btn_4;
  assign clk_0_1 = clk_0;
  assign rst_0_1 = rst_0;
  DisplayColor_Leds_BtnPulsar_0_0 BtnPulsar_0
       (.btn(btn_0_1),
        .clk(clk_0_1),
        .p_btn(BtnPulsar_0_p_btn),
        .rst(rst_0_1));
  DisplayColor_Leds_BtnPulsar_0_1 BtnPulsar_1
       (.btn(btn_1_1),
        .clk(clk_0_1),
        .p_btn(BtnPulsar_1_p_btn),
        .rst(rst_0_1));
  DisplayColor_Leds_BtnPulsar_0_2 BtnPulsar_2
       (.btn(btn_2_1),
        .clk(clk_0_1),
        .p_btn(BtnPulsar_2_p_btn),
        .rst(rst_0_1));
  DisplayColor_Leds_BtnPulsar_0_3 BtnPulsar_3
       (.btn(btn_3_1),
        .clk(clk_0_1),
        .p_btn(BtnPulsar_3_p_btn),
        .rst(rst_0_1));
  DisplayColor_Leds_BtnPulsar_4_0 BtnPulsar_4
       (.btn(btn_4_1),
        .clk(clk_0_1),
        .p_btn(BtnPulsar_4_p_btn),
        .rst(rst_0_1));
  DisplayColor_Leds_Contador_0_0 Contador_0
       (.clk(DivisorFrecuencia_0_clkout),
        .data_in(Memoria_1_data_out),
        .data_out(Contador_0_data_out),
        .rst(rst_0_1));
  DisplayColor_Leds_Conversor_0_0 Conversor_0
       (.Mode(ModeIncDec_0_out1),
        .Set(Set_0_1),
        .clk(clk_0_1),
        .datBin(IncDecDisp_0_out1),
        .datDec(Conversor_0_datDec),
        .rst(rst_0_1));
  DisplayColor_Leds_DecoBCDa7SEG_0_0 DecoBCDa7SEG_0
       (.Out7seg(DecoBCDa7SEG_0_Out7seg),
        .in1(bin_a_bcd_0_bcd_dec));
  DisplayColor_Leds_DecoBCDa7SEG_0_1 DecoBCDa7SEG_1
       (.Out7seg(DecoBCDa7SEG_1_Out7seg),
        .in1(bin_a_bcd_0_bcd_unid));
  DisplayColor_Leds_DisColor_0_0 DisColor_0
       (.Estado(MaquinaEdos_0_address),
        .Segmentos_Color(DisColor_0_Segmentos_Color));
  DisplayColor_Leds_Div_frecuencia_0_0 Div_frecuencia_0
       (.clk(clk_0_1),
        .clkout(Div_frecuencia_0_clkout),
        .rst(rst_0_1));
  DisplayColor_Leds_DivisorFrecuencia_0_0 DivisorFrecuencia_0
       (.clk(clk_0_1),
        .clkout(DivisorFrecuencia_0_clkout),
        .rst(rst_0_1));
  DisplayColor_Leds_IncDecDisp_0_0 IncDecDisp_0
       (.clk(clk_0_1),
        .out1(IncDecDisp_0_out1),
        .p_btn1(BtnPulsar_0_p_btn),
        .p_btn2(BtnPulsar_1_p_btn),
        .rst(rst_0_1));
  DisplayColor_Leds_Leds_0_0 Leds_0
       (.Estado(MaquinaEdos_0_address),
        .InColor(addr_in2_0_1),
        .LedAmarillo(Leds_0_LedAmarillo),
        .LedRojo(Leds_0_LedRojo),
        .LedVerde(Leds_0_LedVerde),
        .clk(Div_frecuencia_0_clkout),
        .mode(Set_0_1),
        .rst(rst_0_1));
  DisplayColor_Leds_MaquinaEdos_0_0 MaquinaEdos_0
       (.address(MaquinaEdos_0_address),
        .clk(clk_0_1),
        .contador(Contador_0_data_out),
        .rst(rst_0_1),
        .start(BtnPulsar_4_p_btn));
  DisplayColor_Leds_Memoria_1_0 Memoria_1
       (.addr_in(MaquinaEdos_0_address),
        .addr_in2(addr_in2_0_1),
        .clk(clk_0_1),
        .data_in(Conversor_0_datDec),
        .data_out(Memoria_1_data_out),
        .read(BtnPulsar_4_p_btn),
        .reset(rst_0_1),
        .write(Set_0_1));
  DisplayColor_Leds_ModeIncDec_0_0 ModeIncDec_0
       (.clk(clk_0_1),
        .out1(ModeIncDec_0_out1),
        .p_btn1(BtnPulsar_2_p_btn),
        .p_btn2(BtnPulsar_3_p_btn),
        .rst(rst_0_1));
  DisplayColor_Leds_bin_a_bcd_0_0 bin_a_bcd_0
       (.bcd_dec(bin_a_bcd_0_bcd_dec),
        .bcd_unid(bin_a_bcd_0_bcd_unid),
        .bin_in(Contador_0_data_out),
        .clk(clk_0_1),
        .conf_in(Conversor_0_datDec),
        .rst(rst_0_1),
        .set(Set_0_1));
endmodule
