% countries = categorical({'China','USA','Brazil','Germany','Canada','India','Japan', 'Russian Fed', 'Italy', 'Spain','France','Turkey','UK','Norway'});
% capacities = [545.916,214.766,122.951,104.704,97.517,90.748,75.125,51.35,51.07,47.954,44.666,34.467,33.516,32.744,27.877];
% bar(countries,capacities)

clear all
clc
filename = 'wind speeds.xlsx';
sheet = 1;
xlRange = 'B2:B33160';

[num,txt] = xlsread(filename,sheet,xlRange);
windspeeds=num;
clear vars filename shhet txt xlRange num sheet

meancik=mean(windspeeds);
varcik=sqrt(var(windspeeds));
x=min(windspeeds):0.0001:max(windspeeds);

pd=fitdist(windspeeds,'Normal')
y=pdf(pd,x);
plot(x,y)
sum=0;

%Low wind için
x1=min(windspeeds):0.001:meancik-varcik;
y=pdf(pd,x1);
Q_low = trapz(x1,y)


%Low wind için
x2=meancik-varcik:0.001:meancik+varcik;
y=pdf(pd,x2);
Q_med = trapz(x2,y)


%Low wind için
x3=meancik+varcik:0.001:max(windspeeds);
y=pdf(pd,x3);
Q_max = trapz(x3,y)



xlabel('Countries')
ylabel('Wind Speeds (m/s)')
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
grid minor

% set(gca,'FontSize',12);
% ax.YGrid = 'on';
% legend('At the end of 2016')
