* SPICE NETLIST
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
.SUBCKT VDD
** N=2 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT GND
** N=1 EP=0 IP=0 FDC=0
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
.SUBCKT Inverter_1 Vdd Gnd Out In
** N=4 EP=4 IP=3 FDC=2
M0 Out In Gnd Gnd NMOS25 L=2.5e-07 W=7.5e-07 $X=205 $Y=-1630 $D=1
M1 Out In Vdd Vdd PMOS25 L=2.5e-07 W=1.5e-06 $X=205 $Y=855 $D=2
.ENDS
***************************************
.SUBCKT AND_2 Gnd A B Vdd Y
** N=6 EP=5 IP=9 FDC=6
X0 Vdd Gnd 6 A B nand_2 $T=0 2295 0 0 $X=-1475 $Y=-1745
X1 Vdd Gnd Y 6 Inverter_1 $T=8800 3840 0 0 $X=5810 $Y=525
.ENDS
***************************************
.SUBCKT ICV_1 1 2 3 4 5 6 7
*.CALIBRE ICV_CELL 11
** N=7 EP=7 IP=10 FDC=12
X0 1 3 4 2 5 AND_2 $T=0 0 0 0 $X=-1475 $Y=-1745
X1 1 5 6 2 7 AND_2 $T=13370 0 0 0 $X=11895 $Y=-1745
.ENDS
***************************************
.SUBCKT ICV_2 1 2 3 4 5 6 7 8 9 10 11
*.CALIBRE ICV_CELL 9
** N=11 EP=11 IP=14 FDC=24
X0 1 4 2 3 5 6 7 ICV_1 $T=0 0 0 0 $X=-1475 $Y=-1745
X1 1 4 2 8 9 10 11 ICV_1 $T=0 11855 0 0 $X=-1475 $Y=10110
.ENDS
***************************************
.SUBCKT S00 Gnd Vdd A B C D S0_0
** N=25 EP=7 IP=69 FDC=86
X0 Vdd 20 Gnd 16 18 nor_2 $T=58480 24365 0 0 $X=61585 $Y=23885
X1 Vdd 22 Gnd 17 19 nor_2 $T=59915 48095 0 0 $X=63020 $Y=47615
X2 Vdd 23 Gnd 21 25 nor_2 $T=76150 24330 0 0 $X=79255 $Y=23850
X3 Vdd Gnd S0_0 22 23 nand_2 $T=74445 49505 0 0 $X=72970 $Y=45465
X4 Vdd Gnd 4 A Inverter_1 $T=6555 -9080 0 0 $X=3565 $Y=-12395
X5 Vdd Gnd 6 B Inverter_1 $T=12105 -9080 0 0 $X=9115 $Y=-12395
X6 Vdd Gnd 8 C Inverter_1 $T=17660 -9080 0 0 $X=14670 $Y=-12395
X7 Vdd Gnd 9 D Inverter_1 $T=23190 -9080 0 0 $X=20200 $Y=-12395
X8 Vdd Gnd 21 20 Inverter_1 $T=72330 27130 0 0 $X=69340 $Y=23815
X9 Gnd Vdd A B 14 9 17 ICV_1 $T=32950 47420 0 0 $X=31475 $Y=45675
X10 Gnd 4 6 Vdd 10 C 25 B 11 8 18 ICV_2 $T=32950 0 0 0 $X=31475 $Y=-1745
X11 Gnd A 6 Vdd 12 D 16 C 13 D 19 ICV_2 $T=32950 23710 0 0 $X=31475 $Y=21965
.ENDS
***************************************
