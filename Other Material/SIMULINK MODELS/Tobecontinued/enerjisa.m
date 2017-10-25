clear all
clc

% Support Time 
sup = 15 ; 

%Sample Time
Ts = 10e-6;

% Initiation
winit = -100;

% Wind Turbine Parameters
Prated =2750000;
R = 51.5; % m
p = 1.225; % air density kg/m3,
windspeed = 10.4; %m/s
windrated = 13; %m/s
Jtur= 35444067; %kgm2

   
%Gear Ratio
gear = 97 ;

%Generator Parameters 
Ld=2.48e-4;
Lq=2.92e-4;
Rs=0.7305e-3;
Jgen = 534.116; %kgm2
pgen = 4; 


fluxlinkage=5.6; % V.s
Ld=2.48e-4;
Lq=2.92e-4;
Rs=0.7305e-3;



%Total Inertia Calculation
Jtotal= Jgen+Jtur/(gear^2);


%DC Bus Settings 
Vdcset = 3000; %% to be updated


%Unnecessary
global Bosluk
Bosluk = 1;
