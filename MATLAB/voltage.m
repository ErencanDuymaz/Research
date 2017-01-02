ts = linspace(0,0.04,100000);
VA = ((400/sqrt(3))*sqrt(2))*sin(2*pi*50*ts);
VB = ((400/sqrt(3))*sqrt(2))*sin((2*pi*50*ts)-(2*pi/3));
VC = ((400/sqrt(3))*sqrt(2))*sin((2*pi*50*ts)-(4*pi/3));

IA = (20 *sqrt(2))*sin((2*pi*50*ts)-(pi/6));

PA = VA .* IA ;

plot(ts,VA,ts,IA,ts,PA);

grid('on')
hold on 
P = (400/sqrt(3))* 20 * cos(pi/6);

Q = (400/sqrt(3))* 20 * sin(pi/6);


S = (400/sqrt(3))* 20;


