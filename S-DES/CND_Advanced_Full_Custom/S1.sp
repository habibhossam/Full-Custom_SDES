* SPICE NETLIST
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
*.CALIBRE ICV_CELL 9
** N=7 EP=7 IP=10 FDC=12
X0 1 3 4 2 5 AND_2 $T=0 0 0 0 $X=-1475 $Y=-1745
X1 1 5 6 2 7 AND_2 $T=13370 0 0 0 $X=11895 $Y=-1745
.ENDS
***************************************
.SUBCKT S1 Gnd Vdd I3 I0 I2 I1 S11 S10
** N=35 EP=8 IP=114 FDC=134
X0 Vdd Gnd S11 28 31 nand_2 $T=73635 86330 1 0 $X=72160 $Y=79015
X1 Vdd Gnd S10 33 34 nand_2 $T=79470 51740 0 0 $X=77995 $Y=47700
X2 Vdd 28 Gnd 23 27 nor_2 $T=62790 87565 1 0 $X=65895 $Y=80310
X3 Vdd 31 Gnd 22 26 nor_2 $T=62790 111320 1 0 $X=65895 $Y=104065
X4 Vdd 34 Gnd 24 29 nor_2 $T=68625 26750 0 0 $X=71730 $Y=26270
X5 Vdd 33 Gnd 25 30 nor_2 $T=68625 50505 0 0 $X=71730 $Y=50025
X6 Vdd Gnd 4 I3 Inverter_1 $T=21045 2945 0 0 $X=18055 $Y=-370
X7 Vdd Gnd 5 I3 Inverter_1 $T=21045 136020 1 0 $X=18055 $Y=131530
X8 Vdd Gnd 7 I0 Inverter_1 $T=26595 2945 0 0 $X=23605 $Y=-370
X9 Vdd Gnd 8 I0 Inverter_1 $T=26595 136020 1 0 $X=23605 $Y=131530
X10 Vdd Gnd 11 I2 Inverter_1 $T=32150 2945 0 0 $X=29160 $Y=-370
X11 Vdd Gnd 12 I1 Inverter_1 $T=32150 136020 1 0 $X=29160 $Y=131530
X12 Vdd Gnd 13 I1 Inverter_1 $T=37680 2945 0 0 $X=34690 $Y=-370
X13 Gnd Vdd I1 5 14 8 23 ICV_1 $T=38590 88250 1 0 $X=37115 $Y=78640
X14 Gnd Vdd I0 5 15 I2 27 ICV_1 $T=38590 100105 1 0 $X=37115 $Y=90495
X15 Gnd Vdd I0 I3 16 I1 22 ICV_1 $T=38590 111960 1 0 $X=37115 $Y=102350
X16 Gnd Vdd 12 I3 17 8 26 ICV_1 $T=38590 123815 1 0 $X=37115 $Y=114205
X17 Gnd Vdd 13 I3 18 11 29 ICV_1 $T=44455 14250 0 0 $X=42980 $Y=12505
X18 Gnd Vdd I0 I2 19 I1 24 ICV_1 $T=44455 26105 0 0 $X=42980 $Y=24360
X19 Gnd Vdd I0 11 20 13 30 ICV_1 $T=44455 37960 0 0 $X=42980 $Y=36215
X20 Gnd Vdd I2 4 21 7 25 ICV_1 $T=44455 49815 0 0 $X=42980 $Y=48070
.ENDS
***************************************
