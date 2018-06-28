time2=xlsread('750W  voltage new.xlsx','D2:D582');
voltagesim=xlsread('750W  voltage new.xlsx','E2:E582');

plot(time2,voltagesim,'r','LineWidth',1.5)

hold on

time=xlsread('750W voltage.csv','A2:A1502');
voltagee=xlsread('750W voltage.csv','B2:B1502');
voltagesim=voltagee*220;

plot(time,voltagesim, '--k','LineWidth',1.5)


xlabel('Time(s)')
ylabel('Voltage (V)')
ax = gca;

ax.XGrid = 'on';
set(gca,'FontSize',14);
grid minor
ax.YGrid = 'on';
xlim([0 20])
ylim([195 225])

legend('Experimental Result','Simulation Result')

saveas(gcf,'750voltage.png')