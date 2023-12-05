** Simple DRAM using PTM 45 nm Node

.include CMOSP.inc
.include CMOSN.inc

.PARAM VDD = 0.8

** Circuit Netlist

** Supply and Input Sources
VSUP X 0 'VDD/2'
VG Y 0 0

** Transistors
M1 Z Y X VDD CMOSN L=45n W=120n

** Capacitor
C1 Z 0 C=1f

** Initial condition
.IC V(Z) = 'VDD'

** Analysis Setup
.TRAN 0.1ns 10n

** Control Information
.OPTION POST BRIEF NOMOD PROBE MEASOUT

** Print and Measurement
.PRINT V(X) V(Z)
.MEASURE TRAN RTL TRIG AT=0 TARG V(Z) VAL=0.6 FALL=1
.MEASURE TRAN AVG_PWR AVG P(M1)

.END