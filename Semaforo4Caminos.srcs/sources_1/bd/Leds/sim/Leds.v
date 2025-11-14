//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Thu Nov 13 11:31:29 2025
//Host        : MSI running 64-bit major release  (build 9200)
//Command     : generate_target Leds.bd
//Design      : Leds
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "Leds,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=Leds,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "Leds.hwdef" *) 
module Leds
   (Estado_0,
    LedAmarillo_0,
    LedRojo_0,
    LedVerde_0,
    clk_0,
    rst_0);
  input [1:0]Estado_0;
  output LedAmarillo_0;
  output LedRojo_0;
  output LedVerde_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET rst_0, CLK_DOMAIN Leds_clk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst_0;

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
  assign clk_0_1 = clk_0;
  assign rst_0_1 = rst_0;
  Leds_Div_frecuencia_0_0 Div_frecuencia_0
       (.clk(clk_0_1),
        .clkout(Div_frecuencia_0_clkout),
        .rst(rst_0_1));
  Leds_Semaforo_0_0 Semaforo_0
       (.Estado(Estado_0_1),
        .LedAmarillo(Semaforo_0_LedAmarillo),
        .LedRojo(Semaforo_0_LedRojo),
        .LedVerde(Semaforo_0_LedVerde),
        .clk(Div_frecuencia_0_clkout),
        .rst(rst_0_1));
endmodule
