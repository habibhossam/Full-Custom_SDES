* SPICE NETLIST
***************************************

.SUBCKT Inverter_1 Vdd Gnd Out In
** N=4 EP=4 IP=0 FDC=2
M0 Out In Gnd Gnd NMOS25 L=2.5e-07 W=7.5e-07 $X=205 $Y=-1630 $D=1
M1 Out In Vdd Vdd PMOS25 L=2.5e-07 W=1.5e-06 $X=205 $Y=855 $D=2
.ENDS
***************************************
.SUBCKT pmos25x_Auto_1_1 B S D G
** N=5 EP=4 IP=0 FDC=1
M0 D G S B PMOS25 L=2.5e-07 W=3e-06 $X=0 $Y=0 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_0_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=1.5e-06 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT XOR Vdd Out Gnd A B
** N=11 EP=5 IP=44 FDC=12
X0 Vdd Gnd 11 B Inverter_1 $T=905 2320 0 0 $X=-2085 $Y=-995
X1 Vdd Gnd 10 A Inverter_1 $T=905 11435 0 0 $X=-2085 $Y=8120
X2 Vdd Vdd 6 A pmos25x_Auto_1_1 $T=7105 10320 0 0 $X=5705 $Y=9570
X3 Vdd 6 Out 11 pmos25x_Auto_1_1 $T=8105 10320 0 0 $X=6705 $Y=9570
X4 Vdd 7 Out B pmos25x_Auto_1_1 $T=9355 10320 1 180 $X=7705 $Y=9570
X5 Vdd Vdd 7 10 pmos25x_Auto_1_1 $T=10355 10320 1 180 $X=8705 $Y=9570
X6 2 Out Gnd 10 nmos25x_Auto_0_1 $T=7355 -775 1 180 $X=6205 $Y=-2075
X7 Gnd 2 Gnd 11 nmos25x_Auto_0_1 $T=8355 -775 1 180 $X=7205 $Y=-2075
X8 Gnd 5 Gnd B nmos25x_Auto_0_1 $T=9105 -775 0 0 $X=8205 $Y=-2075
X9 5 Out Gnd A nmos25x_Auto_0_1 $T=10105 -775 0 0 $X=9205 $Y=-2075
.ENDS
***************************************
