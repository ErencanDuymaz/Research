function [Cp]=powercoefficient(tipspeed,pitchangle)

c1 = 0.5176;
c2 = 116;
c3 = 0.4;
c4 = 5;
c5 = 21;
c6 = 0.0068;
 
li = 1/((1/(tipspeed+0.08*pitchangle))-(0.035/(pitchangle^3+1)));
Cp = c1*((c2/li-c3*pitchangle-c4)*exp(-c5/li))+c6*tipspeed;


end