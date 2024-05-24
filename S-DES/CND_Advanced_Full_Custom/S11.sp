* SPICE NETLIST
***************************************

.SUBCKT GND
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT VDD
** N=2 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT Inverter_1 Vdd Gnd Out In
** N=4 EP=4 IP=3 FDC=2
M0 Out In Gnd Gnd NMOS25 L=2.5e-07 W=7.5e-07 $X=205 $Y=-1630 $D=1
M1 Out In Vdd Vdd PMOS25 L=2.5e-07 W=1.5e-06 $X=205 $Y=855 $D=2
.ENDS
***************************************
.SUBCKT pmos25x_Auto_5_1 B S D G
** N=5 EP=4 IP=0 FDC=1
M0 D G S B PMOS25 L=2.5e-07 W=1.5e-06 $X=0 $Y=0 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_4_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=1.5e-06 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT nand_2 Vdd Gnd Out A B
** N=6 EP=5 IP=21 FDC=4
X2 Vdd Vdd Out A pmos25x_Auto_5_1 $T=705 2630 0 0 $X=-695 $Y=1880
X3 Vdd Vdd Out B pmos25x_Auto_5_1 $T=1955 2630 1 180 $X=305 $Y=1880
X4 Gnd 6 Gnd A nmos25x_Auto_4_1 $T=705 -1355 0 0 $X=-195 $Y=-2655
X5 6 Out Gnd B nmos25x_Auto_4_1 $T=1705 -1355 0 0 $X=805 $Y=-2655
.ENDS
***************************************
.SUBCKT AND_2 Gnd A B Vdd Y
** N=6 EP=5 IP=9 FDC=6
X0 Vdd Gnd Y 6 Inverter_1 $T=8800 3840 0 0 $X=5810 $Y=525
X1 Vdd Gnd 6 A B nand_2 $T=0 2295 0 0 $X=-1475 $Y=-1745
.ENDS
***************************************
.SUBCKT pmos25x_Auto_6_1 B S D G
** N=5 EP=4 IP=0 FDC=1
M0 D G S B PMOS25 L=2.5e-07 W=1.5e-06 $X=0 $Y=0 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_7_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=7.5e-07 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT nor_2 Vdd Out Gnd A B
** N=6 EP=5 IP=18 FDC=4
X0 Vdd Vdd 6 A pmos25x_Auto_6_1 $T=4505 3955 0 0 $X=3105 $Y=3205
X1 Vdd 6 Out B pmos25x_Auto_6_1 $T=5505 3955 0 0 $X=4105 $Y=3205
X2 Gnd Out Gnd A nmos25x_Auto_7_1 $T=4505 820 0 0 $X=3605 $Y=-480
X3 Gnd Out Gnd B nmos25x_Auto_7_1 $T=5755 820 1 180 $X=4605 $Y=-480
.ENDS
***************************************
.SUBCKT S11 Gnd Vdd A B D C S1_1
** N=20 EP=7 IP=67 FDC=66
X0 Vdd Gnd 4 A Inverter_1 $T=7100 -6120 0 0 $X=4110 $Y=-9435
X1 Vdd Gnd 6 B Inverter_1 $T=12650 -6120 0 0 $X=9660 $Y=-9435
X2 Vdd Gnd 8 D Inverter_1 $T=18205 -6120 0 0 $X=15215 $Y=-9435
X3 Vdd Gnd S1_1 18 19 nand_2 $T=59690 43570 0 0 $X=58215 $Y=39530
X4 Gnd 8 A Vdd 9 AND_2 $T=24645 6085 0 0 $X=23170 $Y=4340
X5 Gnd B A Vdd 10 AND_2 $T=24645 17940 0 0 $X=23170 $Y=16195
X6 Gnd B 4 Vdd 11 AND_2 $T=24645 29795 0 0 $X=23170 $Y=28050
X7 Gnd D 4 Vdd 12 AND_2 $T=24645 41650 0 0 $X=23170 $Y=39905
X8 Gnd 9 6 Vdd 16 AND_2 $T=38015 6085 0 0 $X=36540 $Y=4340
X9 Gnd 10 D Vdd 14 AND_2 $T=38015 17940 0 0 $X=36540 $Y=16195
X10 Gnd 11 C Vdd 17 AND_2 $T=38015 29795 0 0 $X=36540 $Y=28050
X11 Gnd 12 6 Vdd 15 AND_2 $T=38015 41650 0 0 $X=36540 $Y=39905
X12 Vdd 19 Gnd 14 16 nor_2 $T=48845 18580 0 0 $X=51950 $Y=18100
X13 Vdd 18 Gnd 15 17 nor_2 $T=48845 42335 0 0 $X=51950 $Y=41855
.ENDS
***************************************
