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
.SUBCKT S01 Gnd Vdd A B C D S0_1
** N=19 EP=7 IP=61 FDC=56
X0 Vdd Gnd 4 A Inverter_1 $T=7665 -9020 0 0 $X=4675 $Y=-12335
X1 Vdd Gnd 6 B Inverter_1 $T=13215 -9020 0 0 $X=10225 $Y=-12335
X2 Vdd Gnd 8 C Inverter_1 $T=18770 -9020 0 0 $X=15780 $Y=-12335
X3 Vdd Gnd 10 D Inverter_1 $T=24300 -9020 0 0 $X=21310 $Y=-12335
X4 Vdd Gnd S0_1 17 18 nand_2 $T=70045 44005 0 0 $X=68570 $Y=39965
X5 Gnd 10 C Vdd 16 AND_2 $T=32950 6085 0 0 $X=31475 $Y=4340
X6 Gnd A 6 Vdd 11 AND_2 $T=32950 17940 0 0 $X=31475 $Y=16195
X7 Gnd 4 10 Vdd 15 AND_2 $T=32950 29795 0 0 $X=31475 $Y=28050
X8 Gnd A B Vdd 12 AND_2 $T=32950 41650 0 0 $X=31475 $Y=39905
X9 Gnd 11 C Vdd 13 AND_2 $T=46320 17940 0 0 $X=44845 $Y=16195
X10 Gnd 12 8 Vdd 14 AND_2 $T=46320 41650 0 0 $X=44845 $Y=39905
X11 Vdd 18 Gnd 13 16 nor_2 $T=55600 18485 0 0 $X=58705 $Y=18005
X12 Vdd 17 Gnd 14 15 nor_2 $T=55600 42255 0 0 $X=58705 $Y=41775
.ENDS
***************************************
