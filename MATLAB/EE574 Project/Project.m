%% Clearing
clear all;
close all;
clc;

%% Bus&Branch Data read
fileID = fopen('ieee_cdf.dat');
A=fread(fileID);
fclose(fileID);
fileID = fopen('measure.dat');
C = fread(fileID);
fclose(fileID);

B = char(A)';
D = char(C)';
tapcounter =0;
m = 0;
m2 = 0;
num = numel(B);
num3 = numel(D);
num_flag = 0;
num_flag2 = 0;

% File is read as array. This section converts it to the matrix to read
% corresponding sections
for l = 1:num
    if double(B(l))==10
        num2 = l-num_flag;
        m = m+1;
        num_flag = l;
        myarray(m) = num2;
    end
end

for l2 = 1:num3
    if double(D(l2))==10
        num4 = l2-num_flag2;
        m2 = m2+1;
        num_flag2 = l2;
        myarray2(m2) = num4;
    end
end

busdata = zeros(m,max(myarray));
measurementdata = zeros(m2,max(myarray2));

count = 1;

for l = 1:num
    a = l-sum(myarray(1:(count-1)));
    busdata(count,a)=B(l);
    if double(B(l))==10
        count = count+1;
    end
end

count3 =1;

for l2 = 1:num3
    a2 = l2-sum(myarray2(1:(count3-1)));
    measurementdata(count3,a2)=D(l2);
    if double(D(l2))==10
        count3 = count3+1;
    end
end

% Bus&Branch data is read as matrix. We should use str2double when it is
% necessary 

% Reading the number of buses 
busnumber=str2double(char(busdata(2,41:46)));
% Reading the number of branches 
branchnumber=str2double(char(busdata(busnumber+4,41:46)));

for counter = 1:busnumber
    if counter <= busnumber;
    busnum(counter,1:4) = busdata(counter+2,1:4);
    busnum2(counter,1) = str2double(char(busnum(counter,1:4)));
    counter =counter+1;
    end
end

for counter2 = 1:branchnumber
    if counter2 <= branchnumber;
    numberoftaps(counter2,1) = str2double(char(busdata(counter2+busnumber+4,77:82)));
        if numberoftaps(counter2,1) ~= 0;
            tapcounter = tapcounter +1 ;
        end 
    branchnum(counter2,1) = str2double(char(busdata(counter2+busnumber+4,1:4)));
    counter2 =counter2+1;
    end
end

%initiate the state vector 
x = zeros(2*busnumber-1+tapcounter,1);
x(1:busnumber,1) = 1;
x(2*busnumber:2*busnumber-1+tapcounter,1) = 1;

% Constituting Jacobian Matrix for the first iteration

% Determining number of measurements

%number of voltage magnitude is denoted by n_v and found by:
n_v = str2double(char(measurementdata(1,1:4)));

%number of power injection measurements is denoted by n_pi and found by:
n_pi = str2double(char(measurementdata(n_v + 2,1:4)));

%number of reactive power injection measurements is denoted by n_qi and
%equal to the active power injection measurements then :
n_qi = n_pi;

%number of power flow measurements is denoted by n_pf and found by:
n_pf = str2double(char(measurementdata(n_v + 2 + 2*n_pi +2,1:4)));

n_qf = n_pf;

%number current magnitude measurement is denoted by n_c and found by:

n_c = str2double(char(measurementdata(n_v + 2 + 2*n_pi +2 + 2*n_pf +2,1:4)));

%Therefore our Jacobian size -> (n_v + 2*n_pi +2* n_pf + n_c)X(2*n-1+n_a)
%Initiate Jacobian H 

H = zeros(n_v + 2*n_pi +2* n_pf + n_c , 2*busnumber+tapcounter -1);
