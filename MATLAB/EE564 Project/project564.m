%% 
% Givens:
% Pout=3kW & n=3000 rpm 

% First, efficiency and power factor should be estimated
% In order to estimate these, we need to get HP values
P = 3000;  % in Watts
n = 3000   % in rpm
Php=3000/746;

%Here we need to visit Design Sheets. 

%Determine pf and efficiency values !!! 
%% 

pf = 0.95;      %From DS
eta = 0.95;     %From DS
%% 

% Then we can find S and S/n values (kVA/1000rpm)

S = P/(pf*eta);  % in VA

S_kVA_1000rpm =  S/n ; 
%% 

% Again, we need to visit the DS to obtain a output coefficient G;

G = 1;          %From DS