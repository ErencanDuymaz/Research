% countries = categorical({'China','USA','Brazil','Germany','Canada','India','Japan', 'Russian Fed', 'Italy', 'Spain','France','Turkey','UK','Norway'});
% capacities = [545.916,214.766,122.951,104.704,97.517,90.748,75.125,51.35,51.07,47.954,44.666,34.467,33.516,32.744,27.877];
% bar(countries,capacities)

clear all
clc
filename = 'World Renewable Capacity.xlsx';
sheet = 4;
xlRange1 = 'B2:D16';
countries = [];

[num,txt] = xlsread(filename,sheet,xlRange1);
c = categorical(txt);
c = c';
num2=num(:,2);
fig = bar(num2,0.4,'b')
xlabel('Countries')
ylabel('Energy Generation from Renewable (TWh)')
ax = gca;
ax.XGrid = 'off';
ax.XTickLabels=[txt]; 
set(gca,'FontSize',12);
grid minor
ax.YGrid = 'on';
legend('At the end of 2016')
% saveas(gcf,'renewableproduction','epsc')

%%
%Production/Capacity
clear all
clc
filename = 'World Renewable Capacity.xlsx';
sheet = 5;
xlRange1 = 'B21:C35';
countries = [];

[num,txt] = xlsread(filename,sheet,xlRange1);
c = categorical(txt);
c = c';
fig = bar(num,0.4,'b')
xlabel('Countries')
ylabel('Renewable Generation/Capacity (TWh/MW)')
ax = gca;
ax.XGrid = 'off';
ax.XTickLabels=[txt]; 
set(gca,'FontSize',12);
grid minor
ax.YGrid = 'on';
legend('At the end of 2016')
% saveas(gcf,'renewableproduction','epsc')
%%