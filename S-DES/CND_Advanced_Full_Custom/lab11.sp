* SPICE NETLIST
***************************************

.SUBCKT Inverter_1 Vdd Gnd Out In
** N=4 EP=4 IP=0 FDC=2
M0 Out In Gnd Gnd NMOS25 L=2.5e-07 W=7.5e-07 $X=205 $Y=-1630 $D=1
M1 Out In Vdd Vdd PMOS25 L=2.5e-07 W=1.5e-06 $X=205 $Y=855 $D=2
.ENDS
***************************************
.SUBCKT lab11 Gnd Vdd In3 In1 In2 Out3 Out2 Out1
** N=8 EP=8 IP=12 FDC=6
X0 Vdd Gnd Out3 In3 Inverter_1 $T=1245 1570 0 0 $X=-1745 $Y=-1745
X1 Vdd Gnd Out2 In2 Inverter_1 $T=1245 9875 0 0 $X=-1745 $Y=6560
X2 Vdd Gnd Out1 In1 Inverter_1 $T=1245 18180 0 0 $X=-1745 $Y=14865
.ENDS
***************************************
