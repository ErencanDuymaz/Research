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
ylabel('TWh')
ax = gca;
grid minor
ax.XGrid = 'off';
ax.XTickLabels=[txt]; 
set(gca,'FontSize',10);
ax.YGrid = 'on';
legend('At the end of 2016')

%saveas(gcf,'windproduction','epsc')
%print('renewableproduction','-depsc','-tiff')
% saveas(gcf,'renewableproduction','epsc')
% print('BarPlot','-depsc')
% print(gcf,'-dbmp','renewablecapacity');
