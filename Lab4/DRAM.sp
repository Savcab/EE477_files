** Simple DRAM using PTM 45 nm Node

.include CMOSP.inc
.include CMOSN.inc

** Circuit Netlist

** Supply and Input Sources
VSUP VDD/2 0 1.0
VPIN Y  0 PULSE 0 1.0 1ns 10ps 10ps 2ns 4ns

** Transistors
M1 Z Y X VDD CMOSP L=45n W=120n

** Capacitor
C1 0 Z C=1f

** Analysis Setup
.TRAN 0.1ns 5n

** Control Information
.OPTION POST BRIEF NOMOD PROBE MEASOUT

** Print and Measurement
.PRINT V(X) V(Z)
.MEASURE TRAN AVG_PWR AVG P(M1)

.END