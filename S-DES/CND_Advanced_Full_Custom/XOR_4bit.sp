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
X2 Vdd Vdd 8 A pmos25x_Auto_1_1 $T=7105 10320 0 0 $X=5705 $Y=9570
X3 Vdd 8 Out 11 pmos25x_Auto_1_1 $T=8105 10320 0 0 $X=6705 $Y=9570
X4 Vdd 9 Out B pmos25x_Auto_1_1 $T=9355 10320 1 180 $X=7705 $Y=9570
X5 Vdd Vdd 9 10 pmos25x_Auto_1_1 $T=10355 10320 1 180 $X=8705 $Y=9570
X6 6 Out Gnd 10 nmos25x_Auto_0_1 $T=7355 -775 1 180 $X=6205 $Y=-2075
X7 Gnd 6 Gnd 11 nmos25x_Auto_0_1 $T=8355 -775 1 180 $X=7205 $Y=-2075
X8 Gnd 7 Gnd B nmos25x_Auto_0_1 $T=9105 -775 0 0 $X=8205 $Y=-2075
X9 7 Out Gnd A nmos25x_Auto_0_1 $T=10105 -775 0 0 $X=9205 $Y=-2075
.ENDS
***************************************
.SUBCKT XOR_4bit Gnd K3 I3 Vdd O3 K2 I2 O2 K1 I1 O1 K0 I0 O0
** N=14 EP=14 IP=20 FDC=48
X0 Vdd O3 Gnd K3 I3 XOR $T=3255 3110 0 0 $X=-1745 $Y=-1745
X1 Vdd O2 Gnd K2 I2 XOR $T=3255 24390 0 0 $X=-1745 $Y=19535
X2 Vdd O1 Gnd K1 I1 XOR $T=3255 45670 0 0 $X=-1745 $Y=40815
X3 Vdd O0 Gnd K0 I0 XOR $T=3275 66950 0 0 $X=-1725 $Y=62095
.ENDS
***************************************
