-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../Oscilloscope.srcs/sources_1/ip/clock/clock_clk_wiz.v" \
  "../../../../Oscilloscope.srcs/sources_1/ip/clock/clock.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

