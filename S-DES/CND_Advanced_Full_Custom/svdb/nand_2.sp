* SPICE NETLIST
***************************************

.SUBCKT pmos25x_Auto_3_1 B S D G
** N=5 EP=4 IP=0 FDC=1
M0 D G S B PMOS25 L=2.5e-07 W=1.5e-06 AD=5.625e-13 AS=9.75e-13 PD=2.25e-06 PS=4.3e-06 $X=0 $Y=0 $D=2
.ENDS
***************************************
.SUBCKT nmos25x_Auto_2_1
** N=4 EP=0 IP=0 FDC=0
*.SEEDPROM
*.CALIBRE ISOLATED NETS: S D B G
.ENDS
***************************************
.SUBCKT nand_2 Vdd Gnd Out A B
** N=6 EP=5 IP=18 FDC=4
M0 3 A Gnd Gnd NMOS25 L=2.5e-07 W=1.5e-06 AD=5.625e-13 AS=9.75e-13 PD=2.25e-06 PS=4.3e-06 $X=705 $Y=-1355 $D=1
M1 Out B 3 Gnd NMOS25 L=2.5e-07 W=1.5e-06 AD=9.75e-13 AS=5.625e-13 PD=4.3e-06 PS=2.25e-06 $X=1705 $Y=-1355 $D=1
X2 Vdd Vdd Out A pmos25x_Auto_3_1 $T=705 2630 0 0 $X=-695 $Y=1880
X3 Vdd Vdd Out B pmos25x_Auto_3_1 $T=1955 2630 1 180 $X=305 $Y=1880
.ENDS
***************************************
