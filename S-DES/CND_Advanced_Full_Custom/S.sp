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
*.CALIBRE ICV_CELL 9
** N=7 EP=7 IP=10 FDC=12
X0 1 3 4 2 5 AND_2 $T=0 0 0 0 $X=-1475 $Y=-1745
X1 1 5 6 2 7 AND_2 $T=13370 0 0 0 $X=11895 $Y=-1745
.ENDS
***************************************
.SUBCKT ICV_2 1 2 3 4 5 6 7 8 9 10 11
*.CALIBRE ICV_CELL 9
** N=11 EP=11 IP=14 FDC=24
X0 1 2 3 4 5 6 7 ICV_1 $T=0 0 0 0 $X=-1475 $Y=-1745
X1 1 2 3 8 9 10 11 ICV_1 $T=0 11855 0 0 $X=-1475 $Y=10110
.ENDS
***************************************
.SUBCKT S00 Gnd Vdd A B C D S0_0
** N=25 EP=7 IP=69 FDC=86
X0 Vdd 21 Gnd 17 19 nor_2 $T=58480 24365 0 0 $X=61585 $Y=23885
X1 Vdd 23 Gnd 18 20 nor_2 $T=59915 48095 0 0 $X=63020 $Y=47615
X2 Vdd 24 Gnd 22 25 nor_2 $T=76150 24330 0 0 $X=79255 $Y=23850
X3 Vdd Gnd S0_0 23 24 nand_2 $T=74445 49505 0 0 $X=72970 $Y=45465
X4 Vdd Gnd 8 A Inverter_1 $T=6555 -9080 0 0 $X=3565 $Y=-12395
X5 Vdd Gnd 9 B Inverter_1 $T=12105 -9080 0 0 $X=9115 $Y=-12395
X6 Vdd Gnd 10 C Inverter_1 $T=17660 -9080 0 0 $X=14670 $Y=-12395
X7 Vdd Gnd 11 D Inverter_1 $T=23190 -9080 0 0 $X=20200 $Y=-12395
X8 Vdd Gnd 22 21 Inverter_1 $T=72330 27130 0 0 $X=69340 $Y=23815
X9 Gnd Vdd A B 16 11 18 ICV_1 $T=32950 47420 0 0 $X=31475 $Y=45675
X10 Gnd Vdd 8 9 12 C 25 B 13 10 19 ICV_2 $T=32950 0 0 0 $X=31475 $Y=-1745
X11 Gnd Vdd A 9 14 D 17 C 15 D 20 ICV_2 $T=32950 23710 0 0 $X=31475 $Y=21965
.ENDS
***************************************
.SUBCKT S1 Gnd Vdd I3 I0 I2 I1 S11 S10
** N=35 EP=8 IP=114 FDC=134
X0 Vdd 30 Gnd 25 29 nor_2 $T=62790 87565 1 0 $X=65895 $Y=80310
X1 Vdd 33 Gnd 24 28 nor_2 $T=62790 111320 1 0 $X=65895 $Y=104065
X2 Vdd 35 Gnd 26 31 nor_2 $T=68625 26750 0 0 $X=71730 $Y=26270
X3 Vdd 34 Gnd 27 32 nor_2 $T=68625 50505 0 0 $X=71730 $Y=50025
X4 Vdd Gnd S11 30 33 nand_2 $T=73635 86330 1 0 $X=72160 $Y=79015
X5 Vdd Gnd S10 34 35 nand_2 $T=79470 51740 0 0 $X=77995 $Y=47700
X6 Vdd Gnd 9 I3 Inverter_1 $T=21045 2945 0 0 $X=18055 $Y=-370
X7 Vdd Gnd 10 I3 Inverter_1 $T=21045 136020 1 0 $X=18055 $Y=131530
X8 Vdd Gnd 11 I0 Inverter_1 $T=26595 2945 0 0 $X=23605 $Y=-370
X9 Vdd Gnd 12 I0 Inverter_1 $T=26595 136020 1 0 $X=23605 $Y=131530
X10 Vdd Gnd 13 I2 Inverter_1 $T=32150 2945 0 0 $X=29160 $Y=-370
X11 Vdd Gnd 14 I1 Inverter_1 $T=32150 136020 1 0 $X=29160 $Y=131530
X12 Vdd Gnd 15 I1 Inverter_1 $T=37680 2945 0 0 $X=34690 $Y=-370
X13 Gnd Vdd I1 10 16 12 25 ICV_1 $T=38590 88250 1 0 $X=37115 $Y=78640
X14 Gnd Vdd I0 10 17 I2 29 ICV_1 $T=38590 100105 1 0 $X=37115 $Y=90495
X15 Gnd Vdd I0 I3 18 I1 24 ICV_1 $T=38590 111960 1 0 $X=37115 $Y=102350
X16 Gnd Vdd 14 I3 19 12 28 ICV_1 $T=38590 123815 1 0 $X=37115 $Y=114205
X17 Gnd Vdd 15 I3 20 13 31 ICV_1 $T=44455 14250 0 0 $X=42980 $Y=12505
X18 Gnd Vdd I0 I2 21 I1 26 ICV_1 $T=44455 26105 0 0 $X=42980 $Y=24360
X19 Gnd Vdd I0 13 22 15 32 ICV_1 $T=44455 37960 0 0 $X=42980 $Y=36215
X20 Gnd Vdd I2 9 23 11 27 ICV_1 $T=44455 49815 0 0 $X=42980 $Y=48070
.ENDS
***************************************
.SUBCKT S Gnd Vdd I7 I4 I6 I5 O2 O3 O0 O1 I3 I0 I2 I1
** N=26 EP=14 IP=76 FDC=276
X0 Vdd 18 Gnd 13 16 nor_2 $T=126573 172475 0 0 $X=129678 $Y=171995
X1 Vdd 17 Gnd 14 15 nor_2 $T=126573 196245 0 0 $X=129678 $Y=195765
X2 Vdd Gnd O2 17 18 nand_2 $T=141018 197995 0 0 $X=139543 $Y=193955
X3 Vdd Gnd 4 I7 Inverter_1 $T=78638 144970 0 0 $X=75648 $Y=141655
X4 Vdd Gnd 6 I4 Inverter_1 $T=84188 144970 0 0 $X=81198 $Y=141655
X5 Vdd Gnd 8 I6 Inverter_1 $T=89743 144970 0 0 $X=86753 $Y=141655
X6 Vdd Gnd 10 I5 Inverter_1 $T=95273 144970 0 0 $X=92283 $Y=141655
X7 Gnd 10 I6 Vdd 16 AND_2 $T=103923 160075 0 0 $X=102448 $Y=158330
X8 Gnd I7 6 Vdd 11 AND_2 $T=103923 171930 0 0 $X=102448 $Y=170185
X9 Gnd 4 10 Vdd 15 AND_2 $T=103923 183785 0 0 $X=102448 $Y=182040
X10 Gnd I7 I4 Vdd 12 AND_2 $T=103923 195640 0 0 $X=102448 $Y=193895
X11 Gnd 11 I6 Vdd 13 AND_2 $T=117293 171930 0 0 $X=115818 $Y=170185
X12 Gnd 12 8 Vdd 14 AND_2 $T=117293 195640 0 0 $X=115818 $Y=193895
X13 Gnd Vdd I7 I4 I6 I5 O3 S00 $T=72083 267770 1 0 $X=75588 $Y=207855
X14 Gnd Vdd I3 I0 I2 I1 O0 O1 S1 $T=61475 -1660 0 0 $X=79530 $Y=-2030
.ENDS
***************************************
