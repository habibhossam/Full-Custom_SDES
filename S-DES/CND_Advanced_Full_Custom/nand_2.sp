* SPICE NETLIST
***************************************

.SUBCKT pmos25x_Auto_3_1 B S D G
** N=5 EP=4 IP=0 FDC=1
M0 D G S B PMOS25 L=2.5e-07 W=1.5e-06 $X=0 $Y=0 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_2_1 S D B G
** N=4 EP=4 IP=0 FDC=1
M0 D G S B NMOS25 L=2.5e-07 W=1.5e-06 $X=0 $Y=0 $D=1
.ENDS
***************************************
.SUBCKT nand_2 Vdd Gnd Out A B
** N=6 EP=5 IP=18 FDC=4
X0 Vdd Vdd Out A pmos25x_Auto_3_1 $T=705 2630 0 0 $X=-695 $Y=1880
X1 Vdd Vdd Out B pmos25x_Auto_3_1 $T=1955 2630 1 180 $X=305 $Y=1880
X2 Gnd 3 Gnd A nmos25x_Auto_2_1 $T=705 -1355 0 0 $X=-195 $Y=-2655
X3 3 Out Gnd B nmos25x_Auto_2_1 $T=1705 -1355 0 0 $X=805 $Y=-2655
.ENDS
***************************************
