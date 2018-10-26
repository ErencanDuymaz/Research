clear all
clc
filename = 'World Wind Energy Capacity.xlsx';
sheet = 1;
xlRange1 = 'F27:H41';
countries = [];

[num,txt] = xlsread(filename,sheet,xlRange1);
c = categorical(txt);
c = c';
a1=bar(num,0.8)
xlabel('Countries')
ylabel('Installed Wind Energy (MW)')
ax = gca;
ax.XGrid = 'off';
ax.XTickLabels=[txt]; 
set(gca,'FontSize',12);
grid minor
ax.YGrid = 'on';
set(a1(1),'FaceColor','blue');
set(a1(2),'FaceColor','green');
legend('At the end of 2016','At the end of 2017')
% saveas(gcf,'windcapacity','epsc')
%print('renewableproduction','-depsc','-tiff')
% saveas(gcf,'renewableproduction','epsc')
% print('BarPlot','-depsc')
% print(gcf,'-dbmp','renewablecapacity');
