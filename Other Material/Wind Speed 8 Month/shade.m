%%
% clear all
% clc
filename = 'wind speeds.xlsx';
sheet = 9;
xlRange = 'A2:A172';

[num,txt] = xlsread(filename,sheet,xlRange);
windspeeds=num';

clear vars filename sheet txt xlRange num sheet

filename = 'wind speeds.xlsx';
sheet = 9;
xlRange = 'K2:K172';

[num,txt] = xlsread(filename,sheet,xlRange);
power=num'/1e6;

clear vars filename sheet txt xlRange num sheet

filename = 'wind speeds.xlsx';
sheet = 9;
xlRange = 'L2:L172';

[num,txt] = xlsread(filename,sheet,xlRange);
powerr=num'/1e6;

clear vars filename sheet txt xlRange num sheet

filename = 'wind speeds.xlsx';
sheet = 9;
xlRange = 'B2:B172';

[num,txt] = xlsread(filename,sheet,xlRange);
rotspeed=num';

clear vars filename sheet txt xlRange num sheet

% plot(windspeeds,cp)
% xlabel('Wind Speeds (m/s)')
% ylabel('Output Power (W)')
% ax = gca;
% ax.XGrid = 'on';
% ax.YGrid = 'on';
% grid minor
% set(gca,'FontSize',20);

%%
hold on all
plot(windspeeds,power-powerr,'k','LineWidth',2)
% plot(windspeeds,powerr,'r','LineWidth',2)
% 
% x2 = [windspeeds , fliplr(windspeeds)];
% inBetween = [powerr , fliplr(power)];
% fill(x2, inBetween, 'g');

xlabel('Wind Speed (m/s)')
ylabel('Available Kinetic Energy (MJ)')
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XColor = 'k'; % Red
ax.YColor = 'k'; % Blue
grid minor
xlim([3 20])
ylim([0 10])
title('')
set(gca,'FontSize',12);
% legend('Stored Energy','Reserved Energy','Location','southeast')
saveas(gcf,'storedenergy1','pdf')

%%
hold on all
plot(windspeeds,rotspeed,'k','LineWidth',2)

xlabel('Wind Speed (m/s)')
ylabel('Rotational Speed (rad/s)')
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XColor = 'k'; % Red
ax.YColor = 'k'; % Blue
grid minor
xlim([3 20])
ylim([0 200])
title('')
set(gca,'FontSize',14);
% legend('Stored Energy','Reserved Energy','Location','southeast')
saveas(gcf,'rotspeed','pdf')