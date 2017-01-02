R1 = 0;
R2 = 0 ; 
R3 = 0;
L1 = 220 * 10^-6 ;
L2 = 80 * 10^-6 ;
C = 60 * 10^-6 ;
num = [ R3 C];
den = [ (L1*L2) (L2*R1+L2*R3+L1*R2+L1*R3) (R1*R2+R2*R3+C*L2+L1*C+R1*R3) (C*R2+R1*C)];
lol = tf(num,den);
bode(lol);
figure
pzmap(lol);