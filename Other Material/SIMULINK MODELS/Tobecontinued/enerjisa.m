% Support Time 

sup = 15 ; 

% Wind Turbine Parameters 
R = 61.44; % m
p = 1.225; % air density kg/m3,
windspeed = 8 ; %m/s
Jtur= 35444067; %kgm2
Beta = 0;    %Pitch Angle

%Gear Ratio
gear = 97 ;


%Generator Parameters 
Jgen = 534.116; %kgm2
pgen = 4; 
winit = -147.4; %initial generator speed
% kt = 4.863e-3;
fluxlinkage=5.6; % V.s
Ld=2.31e-3;
Lq=1.21e-3;
Rs=0.7305e-3;




Jtotal= Jgen+Jtur/(gear^2);


%DC Bus Settings 

Vdcset = 3000; %% to be updated
