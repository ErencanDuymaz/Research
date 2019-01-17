clear all
clc
filename = '9.xls';
sheet = 1;
xlRange = 'R17:R27';

installed= xlsread(filename,sheet,xlRange);

xlRange = 'C17:C27';
years = xlsread(filename,sheet,xlRange);

xlRange = 'M17:Q27';
thermal = xlsread(filename,sheet,xlRange);


bar(thermal/1e3,'stacked')
xlabel('Years')
ylabel('Installed Capacity (GW)')
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XColor = 'k'; % Red
ax.YColor = 'k'; % Blue
grid minor
ylim([0 100])
title('')
set(gca,'xticklabel',years)
set(gca,'FontSize',18);
legend('Thermal','Hydro','Geothermal','Wind','Solar','Orientation','horizontal')
