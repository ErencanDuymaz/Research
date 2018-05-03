clear all
clc

%Sample Time
Ts = 5E-6;
drivefreq = 10e3; % The frequency of the drive
fnom=50;
%Initiation
winit=-170;

% Wind Turbine Parameters
Prated =2750000;
Srated=3.04e6;


R = 51.5; % m
p = 1.225; % air density kg/m3,
windspeed = 9; %m/s
windrated = 13; %m/s
Jtur= 13e6; %kgm2   %Updated
wrated=(2*pi*1735)/60;
wmax=2*pi*(1735/60);
%Gear Ratio
gear = 117.4;

%MPPT Speed
%If the B=0
wMPPT=(8.1*windspeed*gear)/R;
%HighTipSpeedRation
hightip=9.592;
whigh=(hightip*windspeed*gear)/R;

%Generator Parameters 
Jgen = 115; %kgm2
fluxlinkage=4;
pgen = 2;  %Pole Pair
Tbase=Srated/((2*pi*fnom)/pgen);

% Ld=2.48e-4;
% Lq=2.92e-4;
Ld=12e-4;
Lq=12.5e-4;

Rs=1e-10;%0.7305e-4
Ldf=1e-3;
Lqf=1e-3;

Jtotal= Jgen+Jtur/(gear^2);

%DC Bus Settings
Vdcset = 2400; %updated! bu asl?nda böyle de?ildir ama for the time being
Cdc=27e-3;     %updated!

%Filter 
Lfilter=2e-4;
%  Lfilter=1e-3;

%Inertia Support
H=5; %seconds
fnom=50;
suptime=40;
loadtrip=8;
gendelay=1.5;
supduration=2;




