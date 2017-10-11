**----------------------------------------------------------
* 2-INPUT NOR SPICE deck
**----------------------------------------------------------
* Parameters and models
**----------------------------------------------------------
.include mosistsmc180.sp.txt
.options post list scale=1n

**----------------------------------------------------------
* Simulation netlist
**----------------------------------------------------------
Vdd Vdd 0 1.8V
Vin1 in1 0 PULSE 0 1.8V 0.5ns 0.1ns 0.1ns 10ns 20ns
Vin2 in2 0 PULSE 0 1.8V 0.5ns 0.1ns 0.1ns 20ns 40ns

m1 out in1 0 0 NMOS W=180 L=180
m2 out in2 0 0 NMOS W=180 L=180
m3 out in1 X X PMOS W=360 L=180
m4 X in2 Vdd Vdd PMOS W=360 L=180

Cload out 0 0.01pF

.tran 1ns 40ns

.plot V(in) V(out)
.end
