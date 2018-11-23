clear all
clc
filename = 'wind speeds.xlsx';
sheet = 3;
xlRange = 'A2:A172';
num= xlsread(filename,sheet,xlRange);
windspeeds=num;
xlRange = 'F2:F172';
powerw= xlsread(filename,sheet,xlRange);
xlRange = 'G2:G172';
powerpu= xlsread(filename,sheet,xlRange);

clear vars filename shhet txt xlRange num sheet

%%

plot(windspeeds,powerw,'k','LineWidth',2)

xlabel('Wind Speeds (m/s)')
% ylabel('Cumulative Probability (CDF) ')
ylabel('Increase in Active Power (W)')

ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XColor = 'k'; % Red
ax.YColor = 'k'; % Blue
xlim([min(windspeeds) 12])
grid minor
set(gca,'FontSize',12);
saveas(gcf,'power_increasew2','pdf')
