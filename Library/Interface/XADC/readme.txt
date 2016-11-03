Description:
.using the xadc module on B3, get the 4 channels external differential signal voltage and chip's temperature

Interface:
.clk100:		work clock input(100MHz)
.rst:		reset signal, when rst is '1', reset
.vauxp6:	external differential signal XA1_P's positive pole input(XA1_P is defined in B3 schematic diagram)
.vauxn6:	external differential signal XA1_N's negative pole input
.vauxp7:	external differential signal XA3_P's positive pole input
.vauxn7:	external differential signal XA3_N's negative pole input
.vauxp14:	external differential signal XA2_P's positive pole input
.vauxn14:	external differential signal XA2_N's negative pole input
.vauxp15:	external differential signal XA4_P's positive pole input
.vauxn15:	external differential signal XA4_N's negative pole input

.temperature_out: chip's temperature value output
.aux_out_6:  external differential signal XA1's differential voltage value output
.aux_out_7:  external differential signal XA3's differential voltage value output
.aux_out_14:  external differential signal XA2's differential voltage value output
.aux_out_15:  external differential signal XA4's differential voltage value output