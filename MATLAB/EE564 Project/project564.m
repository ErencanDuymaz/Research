clear all 
clc
% Givens:
% Pout=3kW & n=3000 rpm 

% First, efficiency and power factor should be estimated
% In order to estimate these, we need to get HP values
P = 3000;  % in Watts
n = 3000;   % in rpm
f = 50; % in Hz
Php=3000/746;

%Here we need to visit Design Sheets. 
%Determine pf and efficiency values !!! 

pf = 0.78;                              %From DS
eta = 0.82;                             %From DS

% Then we can find S and S/n values (kVA/1000rpm)

S = P/(pf*eta);  % in VA
S_kVA_1000rpm =  S/n ; 
fprintf('S/n is %4.2f kVA/1000rpm\n',S_kVA_1000rpm)

% Again, we need to visit the DS to obtain a output coefficient G;

G = 1;                                   %From DS
fprintf('Output Coefficient is selected as %4.2f \n',G)
% Now, we know that S/n = G Di^2*L
% Here notice that S/n is kVA/rpm (not kVA/1000rpm)

S_kVA_rpm = S_kVA_1000rpm / 1000;
di_2_L = S_kVA_rpm / G ;

% We should also check the core length/pole pitch ratio
p = (120*f)/n;

% p =2 gives kr = 0.75 

kr = 0.75;                                %From DS
D_i=(di_2_L*p/(pi*kr))^(1/3);
fprintf('Di is %4.2f m\n',D_i)

L = di_2_L/(D_i^2) ; 
fprintf('L is %4.2f m\n',L)

%In order to find D_o, we need to visit DS7
Di_Do = 0.5;                           %From DS

D_o = D_i/Di_Do;
fprintf('Do is %4.2f m\n',D_o)
%This is a small sized machine. Vph=400 V is OK.
%This machine is delta connected. 
%Vph=eph=4.44*f*kw*N*Phi
Vph =400; %in Volts 
fprintf('Vph is %4.2f V\n',Vph)
% In order to determine turns/phase, 
% we need to choose magnetic loading. 

B = 0.45 ;  %in T                    %From DS3
fprintf('Magnetic Loading is %4.2f T\n',B)
%Now we can find the flux/pole

Phi = (B*pi*D_i*L)/p; 
fprintf('Flux per pole is %4.2f Wb \n',Phi)
%Now, assume a kw=0.9 

N = Vph/(4.44*50*0.9*Phi);   %in Turns
fprintf('N is %4.2f turns/phase \n',N)
%Now, check the current loading 

I_ph = S / (3*Vph); %in Amps
fprintf('Iph is %4.2f A\n',I_ph)
q = (3*2*N*I_ph)/(pi*D_i) ; 
fprintf('Current Loading is %4.2f A/m\n',q)
%Current Loading is inside the limits.


