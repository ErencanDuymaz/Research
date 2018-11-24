clear all
clc
filename = 'World Wind Energy Capacity.xlsx';
sheet = 4;
xlRange1 = 'B2:D16';
countries = [];

[num,txt] = xlsread(filename,sheet,xlRange1);
c = categorical(txt);
c = c';
num2=num(:,2);
bar(num2,0.5,'b')
xlabel('Countries')
ylabel('Energy Generation from Wind (TWh)')
ax = gca;
grid minor
ax.XGrid = 'off';
ax.XTickLabels=[txt];
ax.XTickLabelRotation = 45;
ax.XColor = 'k'; % Red
ax.YColor = 'k'; % Blue
set(gca,'FontSize',12);
ax.YGrid = 'on';
legend('At the end of 2016')
saveas(gcf,'windproduction','pdf')
%print('renewableproduction','-depsc','-tiff')
% saveas(gcf,'renewableproduction','epsc')
% print('BarPlot','-depsc')
% print(gcf,'-dbmp','renewablecapacity');

%%
clear all
clc
filename = 'World Wind Energy Capacity.xlsx';
sheet = 1;
xlRange1 = 'O27:R41';
countries = [];

[num,txt] = xlsread(filename,sheet,xlRange1);
c = categorical(txt);
c = c';
num2=num(:,3);

bar(num2,0.5,'b')
xlabel('Countries')
ylabel('Wind Energy Generation/Capacity(GWh/MW)')
ax = gca;
grid minor
ax.XGrid = 'off';
ax.XTickLabels=[txt];
ax.XTickLabelRotation = 45; 
ax.XColor = 'k'; % Red
ax.YColor = 'k'; % Blue
set(gca,'FontSize',12);
ax.YGrid = 'on';
legend('At the end of 2016')
saveas(gcf,'windpro_cap','pdf')



