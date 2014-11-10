######################################################################
# Copyright (c) 2004 Xilinx, Inc.  All rights reserved. 
# 
# Xilinx, Inc. 
# XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
# COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS 
# ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
# STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
# IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
# FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION. 
# XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
# THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
# ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
# FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
# AND FITNESS FOR A PARTICULAR PURPOSE. 
# 
# File   : microblaze_enable_dcache.s
# Date   : 2002, March 20.
# Company: Xilinx
# Group  : Emerging Software Technologies
#
# Summary:
# Enable L1 dcache on the microblaze.
#
#
####################################################################

#include "xparameters.h"	

	.text
	.globl	microblaze_enable_dcache
	.ent	microblaze_enable_dcache
	.align	2
microblaze_enable_dcache:	

#if XPAR_MICROBLAZE_USE_MSR_INSTR == 1
	rtsd	r15, 8
	msrset  r0, 0x80
#else /*XPAR_MICROBLAZE_USE_MSR_INSTR == 1*/
	#Read the MSR register
	mfs	r8, rmsr
	#Set the interrupt enable bit
	ori	r8, r8, 0x80
	#Save the MSR register
	mts	rmsr, r8
	#Return
	rtsd	r15, 8
	nop
#endif /*XPAR_MICROBLAZE_USE_MSR_INSTR == 1*/
	.end	microblaze_enable_dcache

	
  
