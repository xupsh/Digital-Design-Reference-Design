##############################################################-*-asm-*- 
#
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
# Enable exceptions on microblaze.
#
#
####################################################################

#include "xparameters.h"

	.text
	.globl	microblaze_enable_exceptions
	.ent	microblaze_enable_exceptions
	.align 2
microblaze_enable_exceptions:
#if XPAR_MICROBLAZE_USE_MSR_INSTR == 1
	rtsd    r15, 8;
        msrset  r0, 0x100
#else /*XPAR_MICROBLAZE_USE_MSR_INSTR == 1*/
        mfs     r4, rmsr;
        ori     r4, r4, 0x100;                  /* Turn ON the EE bit */
        mts     rmsr, r4;
        rtsd    r15, 8;
        nop;       
#endif /*XPAR_MICROBLAZE_USE_MSR_INSTR == 1*/
.end microblaze_enable_exceptions

	
  
