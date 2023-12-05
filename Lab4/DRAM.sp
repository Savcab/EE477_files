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
C1 Z 0 C=10f

** Initial condition
.IC V(Z) = 'VDD'

** Analysis Setup
.TRAN 0.001u 800u

** Control Information
.OPTION POST BRIEF NOMOD PROBE MEASOUT

** Print and Measurement
.PRINT V(X) V(Z)
.MEASURE TRAN RTL TRIG AT=0 TARG V(Z) VAL=0.6 FALL=1
.MEASURE TRAN AVG_CUR AVG I(C1) FROM 0 to 'RTL'
.MEASURE TRAN AVG_PWR AVG P(C1) FROM 0 to 'RTL'

.END