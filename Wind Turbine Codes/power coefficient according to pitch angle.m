clear all
clc
C = [];
C2 = [];
I = [];

c1 = 0.5176;
c2 = 116;
c3 = 0.4;
c4 = 5;
c5 = 21;
c6 = 0.0068;
u=0; % Pitch Angle

for i = 0.01:0.01:15
    
li = 1/((1/(i+0.08*u))-(0.035/(u^3+1)));
A = c1*((c2/li-c3*u-c4)*exp(-c5/li))+c6*i ;%#codegen

Cp = c1*((c2/li-c3*u-c4)*exp(-c5/li))+c6*i;

C = [ C Cp];
I = [ I i ];

end
plot(I,C)
axis([0 15 -0.1 0.5])
hold on

u=1.2; % Pitch Angle

for i = 0.01:0.01:15
    
li = 1/((1/(i+0.08*u))-(0.035/(u^3+1)));
A = c1*((c2/li-c3*u-c4)*exp(-c5/li))+c6*i ;%#codegen

Cp = c1*((c2/li-c3*u-c4)*exp(-c5/li))+c6*i;

C2 = [ C2 Cp];


end

plot(I,C2)
