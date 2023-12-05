** Simple DRAM using PTM 45 nm Node

.include CMOSP.inc
.include CMOSN.inc

** Circuit Netlist

** Supply and Input Sources
V_SUP VDD 0 1
VPIN_A A 0 PULSE 0 1.0 1ns 10ps 10ps 4ns 8ns
VPIN_B B 0 PULSE 0 1.0 1ns 10ps 10ps 2ns 4ns

** Transistors
M_PU_A OUT A VDD CMOSP L=45n W=180n
M_PU_B OUT B VDD CMOSP L=45n W=180n

M_PD_A OUT A X CMOSN L=45n W=240n
M_PD_B X B 0 CMOSN L=45n W=240n

** Initial condition
.IC V(X) = 0

** Analysis Setup
.TRAN 0.1ns 10n

** Control Information
.OPTION POST BRIEF NOMOD PROBE MEASOUT

** Print and Measurement
.PRINT V(A) V(B) V(OUT)

.END