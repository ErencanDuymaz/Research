clear all
clc
filename = 'World Wind Energy Capacity.xlsx';
sheet = 3;
xlRange1 = 'B2:D16';
countries = [];

[num,txt] = xlsread(filename,sheet,xlRange1);
c = categorical(txt);
c = c';
num2=num(:,2);
bar(num2,0.5)
xticklabels(txt) 
xlabel('Countries')
ylabel('TWh')
ax = gca;
ax.XGrid = 'off';
set(gca,'FontSize',10);
% grid minor
ax.YGrid = 'on';

saveas(gcf,'windproduction','epsc')
%print('renewableproduction','-depsc','-tiff')
% saveas(gcf,'renewableproduction','epsc')
% print('BarPlot','-depsc')
% print(gcf,'-dbmp','renewablecapacity');
