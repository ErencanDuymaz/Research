% countries = categorical({'China','USA','Brazil','Germany','Canada','India','Japan', 'Russian Fed', 'Italy', 'Spain','France','Turkey','UK','Norway'});
% capacities = [545.916,214.766,122.951,104.704,97.517,90.748,75.125,51.35,51.07,47.954,44.666,34.467,33.516,32.744,27.877];
% bar(countries,capacities)

clear all
clc
filename = 'World Renewable Capacity.xlsx';
sheet = 1;
xlRange1 = 'B2:D16';
countries = [];

[num,txt] = xlsread(filename,sheet,xlRange1);
c = categorical(txt);
c = c';
num2=num(:,2);
bar(num2,0.5)
xticklabels(txt) 
xlabel('Countries')
ylabel('MW')
ax = gca;
ax.XGrid = 'off';
set(gca,'FontSize',12);
% grid minor
ax.YGrid = 'on';

saveas(gcf,'renewablecapacity','epsc')
%print('renewableproduction','-depsc','-tiff')
% saveas(gcf,'renewableproduction','epsc')
% print('BarPlot','-depsc')
% print(gcf,'-dbmp','renewablecapacity');
