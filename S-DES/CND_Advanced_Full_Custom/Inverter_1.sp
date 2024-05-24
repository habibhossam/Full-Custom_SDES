* SPICE NETLIST
***************************************

.SUBCKT Inverter_1 Vdd Gnd Out In
** N=4 EP=4 IP=0 FDC=2
M0 Out In Gnd Gnd NMOS25 L=2.5e-07 W=7.5e-07 $X=205 $Y=-1630 $D=1
M1 Out In Vdd Vdd PMOS25 L=2.5e-07 W=1.5e-06 $X=205 $Y=855 $D=2
.ENDS
***************************************
