time=xlsread('375W  voltage new new.xlsx','D2:D584');
voltageex=xlsread('375W  voltage new new.xlsx','F2:F584');


plot(time,voltageex, 'r','LineWidth',1.5)

hold on

time2=xlsread('375W  voltage new.xlsx','G2:G6003');
voltagesim=xlsread('375W  voltage new.xlsx','I2:I6003');

plot(time2,voltagesim,'--k','LineWidth',1.5)


xlabel('Time(s)')
ylabel('Voltage (V)')
ax = gca;
ax.XGrid = 'on';
set(gca,'FontSize',14);
grid minor
ax.YGrid = 'on';
xlim([0 20])
ylim([205 225])

legend('Experimental Result','Simulation Result')

saveas(gcf,'375voltage.png')