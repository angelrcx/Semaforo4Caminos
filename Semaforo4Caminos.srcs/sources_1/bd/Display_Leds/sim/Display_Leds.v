//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Fri Nov 14 11:19:15 2025
//Host        : MSI running 64-bit major release  (build 9200)
//Command     : generate_target Display_Leds.bd
//Design      : Display_Leds
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "Display_Leds,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=Display_Leds,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "Display_Leds.hwdef" *) 
module Display_Leds
   (Estado_0,
    LedAmarillo_0,
    LedRojo_0,
    LedVerde_0,
    Segmentos_Color_0,
    clk_0,
    rst_0);
  input [1:0]Estado_0;
  output LedAmarillo_0;
  output LedRojo_0;
  output LedVerde_0;
  output [6:0]Segmentos_Color_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET rst_0, CLK_DOMAIN Display_Leds_clk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst_0;

  wire [6:0]DisColor_0_Segmentos_Color;
  wire Div_frecuencia_0_clkout;
  wire [1:0]Estado_0_1;
  wire Semaforo_0_LedAmarillo;
  wire Semaforo_0_LedRojo;
  wire Semaforo_0_LedVerde;
  wire clk_0_1;
  wire rst_0_1;

  assign Estado_0_1 = Estado_0[1:0];
  assign LedAmarillo_0 = Semaforo_0_LedAmarillo;
  assign LedRojo_0 = Semaforo_0_LedRojo;
  assign LedVerde_0 = Semaforo_0_LedVerde;
  assign Segmentos_Color_0[6:0] = DisColor_0_Segmentos_Color;
  assign clk_0_1 = clk_0;
  assign rst_0_1 = rst_0;
  Display_Leds_DisColor_0_0 DisColor_0
       (.Estado(Estado_0_1),
        .Segmentos_Color(DisColor_0_Segmentos_Color));
  Display_Leds_Div_frecuencia_0_0 Div_frecuencia_0
       (.clk(clk_0_1),
        .clkout(Div_frecuencia_0_clkout),
        .rst(rst_0_1));
  Display_Leds_Semaforo_0_0 Semaforo_0
       (.Estado(Estado_0_1),
        .LedAmarillo(Semaforo_0_LedAmarillo),
        .LedRojo(Semaforo_0_LedRojo),
        .LedVerde(Semaforo_0_LedVerde),
        .clk(Div_frecuencia_0_clkout),
        .rst(rst_0_1));
endmodule
