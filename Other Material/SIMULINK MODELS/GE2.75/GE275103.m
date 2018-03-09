clear all
clc

% Support Time 
sup = 15 ; 
%Sample Time
Ts = 5E-6;
drivefreq = 30e3; % The frequency of the drive

%Initiation
winit=-185;

% Wind Turbine Parameters
Prated =2750000;

R = 51.5; % m
p = 1.225; % air density kg/m3,
windspeed = 10; %m/s
windrated = 13; %m/s
Jtur= 13e6; %kgm2   %Updated

%Gear Ratio
gear = 117.4 ;

%Generator Parameters 
Jgen = 115; %kgm2
fluxlinkage=4;
pgen = 2;  %Pole Pair

Ld=2.48e-4;
Lq=2.92e-4;
Rs=1e-10;%0.7305e-4
Ldf=1e-3;
Lqf=1e-3;

Jtotal= Jgen+Jtur/(gear^2);

%DC Bus Settings
Vdcset = 2500; %updated! bu asl?nda böyle de?ildir ama for the time being
Cdc=27e-3;     %updated!

%Filter 
Lfilter=2e-4;

%Inertia Support
H=3.5; %seconds
fnom=50;




