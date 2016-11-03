############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2015 Xilinx Inc. All rights reserved.
############################################################
open_project sobel_rd_prj
set_top sobel_filter
add_files sobel.h
add_files sobel.cpp
add_files ap_bmp.h
add_files -tb test_1080p.bmp
add_files -tb sobel_test.cpp
add_files -tb result_1080p_golden.bmp
add_files -tb ap_bmp.cpp
open_solution "solution3"
set_part {xc7a35tcpg236-1}
create_clock -period 40 -name default
source "./sobel_rd_prj/solution3/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
