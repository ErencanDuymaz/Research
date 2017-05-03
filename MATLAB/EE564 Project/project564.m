
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


pf = 0.76;                              %From DS
eta = 0.85;                             %From DS


% Then we can find S and S/n values (kVA/1000rpm)

S = P/(pf*eta);  % in VA

S_kVA_1000rpm =  S/n ; 
fprintf('S/n is %4.2f kVA/1000rpm',S_kVA_1000rpm)


% Again, we need to visit the DS to obtain a output coefficient G;

G = 1;                                   %From DS

% Now, we know that S/n = G Di^2*L

% Here notice that S/n is kVA/rpm (not kVA/1000rpm)

S_kVA_rpm = S_kVA_1000rpm / 1000;

di_2_L = S_kVA_rpm / G 

% We should also check the core length/pole pitch ratio

p = (120*f)/n;

% p =2 gives kr = 0.75 

kr = 0.75;                                %From DS