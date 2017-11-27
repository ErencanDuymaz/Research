clear all
clc

% Support Time
sup = 15 ;

%Sample Time
Ts = 5e-6;
drivefreq = 5e3; % The frequency of the drive
% Initiation
winit = -170;


% Wind Turbine Parameters
Prated =2750000;
R = 51.5; % m
p = 1.225; % air density kg/m3,
windspeed = 10.4; %m/s
windrated = 13; %m/s
Jtur= 3e6; %kgm2


%Gear Ratio
gear = 97 ;

%Generator Parameters
Ld=2.48e-4;
Lq=2.92e-4;
Rs=0.7305e-4;
Jgen = 200; %kgm2
pgen = 4;


fluxlinkage=2; % V.s
torqueconstant=4.136; %Nm/Apeak
Ld=2.48e-4;
Lq=2.92e-4;
Rs=0.7305e-3;



%Total Inertia Calculation
Jtotal= Jgen+Jtur/(gear^2);


%DC Bus Settings
Vdcset = 900; %% to be updated

%LCL Filter
L1f=1e-3;
L2f=1e-4;
Cf= 1e-6;


%Unnecessary
global Bosluk
Bosluk = 1;
