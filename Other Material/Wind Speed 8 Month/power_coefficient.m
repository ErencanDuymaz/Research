clear all
clc
filename = 'wind speeds.xlsx';
sheet = 2;
xlRange = 'A31:A201';

[num,txt] = xlsread(filename,sheet,xlRange);
windspeeds=num;

clear vars filename sheet txt xlRange num sheet

filename = 'wind speeds.xlsx';
sheet = 2;
xlRange = 'I31:I201';

[num,txt] = xlsread(filename,sheet,xlRange);
cp=num;

clear vars filename sheet txt xlRange num sheet

plot(windspeeds,cp,'k','LineWidth',2)

xlabel('Wind Speeds (m/s)')
ylabel('Power Coefficient')
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XColor = 'k'; % Red
ax.YColor = 'k'; % Blue
grid minor
xlim([3 20])
ylim([0 0.5])
title('')
set(gca,'FontSize',14);
saveas(gcf,'cp_wind','pdf')

%%
clear all
clc
filename = 'wind speeds.xlsx';
sheet = 2;
xlRange = 'A31:A201';

[num,txt] = xlsread(filename,sheet,xlRange);
windspeeds=num;

clear vars filename sheet txt xlRange num sheet

filename = 'wind speeds.xlsx';
sheet = 2;
xlRange = 'J31:J201';

[num,txt] = xlsread(filename,sheet,xlRange);
cp=num;

clear vars filename sheet txt xlRange num sheet

% plot(windspeeds,cp)
% xlabel('Wind Speeds (m/s)')
% ylabel('Output Power (W)')
% ax = gca;
% ax.XGrid = 'on';
% ax.YGrid = 'on';
% grid minor
% set(gca,'FontSize',20);

plot(windspeeds,cp/(1e6),'k','LineWidth',2)

xlabel('Wind Speed (m/s)')
ylabel('Output Power (MW)')
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XColor = 'k'; % Red
ax.YColor = 'k'; % Blue
grid minor
xlim([3 20])
ylim([0 3])
title('')
set(gca,'FontSize',14);

% saveas(gcf,'powerdata','pdf')