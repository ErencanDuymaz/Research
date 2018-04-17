clear all
clc

%Sample Time
Ts = 5E-6;
drivefreq = 3e3; % The frequency of the drive
fnom=50;
%Initiation
winit=-175;

% Wind Turbine Parameters
Prated =2750000;

R = 51.5; % m
p = 1.225; % air density kg/m3,
windspeed = 8; %m/s
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
suptime=15;


%High Tip Speed Ratio Calculation

c1 = 0.5176;
c2 = 116;
c3 = 0.4;
c4 = 5;
c5 = 21;
c6 = 0.0068;
tip =[];
Cp=[];

u=0; %Pitch Angle

for i = 0.1:0.001:15
    
li = 1/((1/(i+0.08*u))-(0.035/(u^3+1)));
% A = c1*((c2/li-c3*u-c4)*exp(-c5/li))+c6*i;
Cp2 = c1*((c2/li-c3*u-c4)*exp(-c5/li))+c6*i;
tip = [ tip i];
Cp = [ Cp Cp2];
[M I]= max(Cp);
tipmax=tip(I(1));
Cpmax=M(1);

end

tips = find(abs(Cp-Cpmax*0.9)<0.0001);


if numel(tips)>1
    tips = max(tips);
end

hightip = tip(tips);
whigh=(hightip*windspeed*gear)/R;

