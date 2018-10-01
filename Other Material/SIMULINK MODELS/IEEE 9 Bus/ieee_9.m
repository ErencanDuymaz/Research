clear all
clc
Ts=1e-5;

Sbase=100e6;
Vbase=230e3;
Ibase=Sbase/(sqrt(3)*Vbase);

Xbase=(Vbase^2)/Sbase;
Ybase=1/Xbase;

Lbase=Xbase/(100*pi);
Cbase=1/(100*pi*Xbase);
startup=2; 
loadconnection=15;