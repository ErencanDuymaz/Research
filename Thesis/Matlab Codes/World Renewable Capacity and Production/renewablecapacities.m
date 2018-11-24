% countries = categorical({'China','USA','Brazil','Germany','Canada','India','Japan', 'Russian Fed', 'Italy', 'Spain','France','Turkey','UK','Norway'});
% capacities = [545.916,214.766,122.951,104.704,97.517,90.748,75.125,51.35,51.07,47.954,44.666,34.467,33.516,32.744,27.877];
% bar(countries,capacities)

clear all
clc
filename = 'World Renewable Capacity.xlsx';
sheet = 1;
xlRange1 = 'B28:D42';
% countries = [];

[num,txt] = xlsread(filename,sheet,xlRange1);
c = categorical(txt);
c = c';
% num2=num(:,2);
a1=bar(num,0.8)

% xtick(c)
xlabel('Countries')
ylabel('Installed Renewable Energy (MW)')
ax = gca;
ax.XGrid = 'off';
set(gca,'FontSize',12);
grid minor
ax.YGrid = 'on';
ax.XTickLabels=[txt];
ax.XTickLabelRotation = 45;
ax.XColor = 'k'; % Red
ax.YColor = 'k'; % Blue
set(a1(1),'FaceColor','blue');
set(a1(2),'FaceColor','green');
legend('At the end of 2016','At the end of 2017')
saveas(gcf,'renewablecapacity','pdf')
% saveas(gcf,'renewablecapacity','png')
