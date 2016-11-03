-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
-- Date        : Tue Nov 01 08:30:05 2016
-- Host        : XSHZHEHENGT30 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/Github/xupsh/Basys3-Git/Projects_2016.2/2_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/xadc_0/xadc_0_stub.vhdl
-- Design      : xadc_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xadc_0 is
  Port ( 
    clk100 : in STD_LOGIC;
    rst : in STD_LOGIC;
    vauxp6 : in STD_LOGIC;
    vauxn6 : in STD_LOGIC;
    vauxp7 : in STD_LOGIC;
    vauxn7 : in STD_LOGIC;
    vauxp14 : in STD_LOGIC;
    vauxn14 : in STD_LOGIC;
    vauxp15 : in STD_LOGIC;
    vauxn15 : in STD_LOGIC;
    temperature_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    aux_out_6 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    aux_out_7 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    aux_out_14 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    aux_out_15 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end xadc_0;

architecture stub of xadc_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk100,rst,vauxp6,vauxn6,vauxp7,vauxn7,vauxp14,vauxn14,vauxp15,vauxn15,temperature_out[15:0],aux_out_6[15:0],aux_out_7[15:0],aux_out_14[15:0],aux_out_15[15:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "xadc,Vivado 2014.4";
begin
end;
