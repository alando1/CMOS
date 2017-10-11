**----------------------------------------------------------
* 2-input Multiplexer Gate SPICE deck
**----------------------------------------------------------
* Parameters and models
**----------------------------------------------------------
.include mosistsmc180.sp.txt
.options post list scale=1n

**----------------------------------------------------------
* Simulation netlist
**----------------------------------------------------------
Vdd Vdd 0 1.8V
Vd0 d0  0 PULSE 0 1.8V 0.5ns 0.1ns 0.1ns 4ns 8ns
vd1 d1  0 PULSE 1.8V 0 0.5ns 0.1ns 0.1ns 4ns 8ns
Vin in  0 PULSE 0 1.8V 0.5ns 0.1ns 0.1ns 4ns 8ns
Vin2 Clock  0 PULSE 0 1.8V 0.5ns 0.1ns 0.1ns 10ns 20ns
Vin3 Clockb 0 PULSE 1.8V 0 0.5ns 0.1ns 0.1ns 10ns 20ns

m1 out Clock   d0  Vdd  PMOS W=360 L=180
m2 out Clockb  d0  0    NMOS W=180 L=180
m3 out Clockb  d1  Vdd  PMOS W=360 L=180
m4 out Clock   d1  0    NMOS W=180 L=180


Cload out 0 0.01pF

.tran 1ns 40ns
.plot V(in) V(out)
.end
