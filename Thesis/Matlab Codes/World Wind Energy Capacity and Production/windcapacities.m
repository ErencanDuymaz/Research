clear all
clc
filename = 'World Wind Energy Capacity.xlsx';
sheet = 6;
xlRange1 = 'B27:D41';
countries = [];

[num,txt] = xlsread(filename,sheet,xlRange1);
c = categorical(txt);
c = c';
num2= []
a1=bar(num,0.8)
xlabel('Countries')
ylabel('Installed Wind Capacity (MW)')
ax = gca;
ax.XGrid = 'off';
ax.XTickLabels=[txt]; 
ax.XTickLabelRotation = 45; 
ax.XColor = 'k'; % Red
ax.YColor = 'k'; % Blue
set(gca,'FontSize',12);
grid minor
ax.YGrid = 'on';
set(a1(1),'FaceColor','blue');
set(a1(2),'FaceColor','green');
legend('At the end of 2016','At the end of 2017')
saveas(gcf,'windcapacity','pdf')
%print('renewableproduction','-depsc','-tiff')
% saveas(gcf,'renewableproduction','epsc')
% print('BarPlot','-depsc')
% print(gcf,'-dbmp','renewablecapacity');
