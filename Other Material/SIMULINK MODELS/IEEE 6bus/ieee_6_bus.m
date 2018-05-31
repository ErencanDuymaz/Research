clear all
clc
Ts=10e-6;

Sbase=100e6;
Vbase=154e3;
Ibase=Sbase/(sqrt(3)*Vbase);

Xbase=(Vbase^2)/Sbase;
Ybase=1/Xbase;

Lbase=Xbase/(100*pi);
Cbase=1/(100*pi*Xbase);