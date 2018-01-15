clear all
clc

% Support Time
sup = 15 ;

%Sample Time
Ts = 10e-6;
drivefreq = 5e3; % The frequency of the drive
% Initiation
winit = -160;


% Wind Turbine Parameters
Prated =2750000;
R = 51.5; % m
p = 1.225; % air density kg/m3,
windspeed = 10; %m/s
windrated = 13; %m/s
Jtur= 13e6; %kgm2   %Updated


%Gear Ratio
gear = 97 ;

%Generator Parameters
Ld=2.48e-4;
Lq=2.92e-4;
Rs=0.7305e-4;
Jgen = 200; %kgm2
pgen = 4;


fluxlinkage=4; % V.s
torqueconstant=4.136; %Nm/Apeak
Ld=2.48e-4;
Lq=2.92e-4;
Rs=0.7305e-3;



%Total Inertia Calculation
Jtotal= Jgen+Jtur/(gear^2);


%DC Bus Settings
Vdcset = 1073; %updated! bu asl?nda böyle de?ildir ama for the time being
Cdc=27e-3;     %updated!

%LCL Filter    %updated!
L1f=800e-6;
L2f=400e-4;
Cf= 185e-6;


%Unnecessary
global Bosluk
Bosluk = 1;
