time=xlsread('datafreq750_H6.csv','A1:A2502');
freq=xlsread('datafreq750_H6.csv','B1:B2502');

plot(time,freq, '--k','LineWidth',2)

hold on

freq2=xlsread('5000 msec freq 8+1.xlsx','B56:B151');
time2=xlsread('5000 msec freq 8+1.xlsx','D56:D151');

plot(time2,freq2,'k','LineWidth',2)


xlabel('Time(s)')
ylabel('Frequency (Hz)')
ax = gca;
ax.XGrid = 'on';
set(gca,'FontSize',14);
% grid minor
ax.YGrid = 'on';
xlim([0 25])
ylim([47 50.5])

legend('Simulation Result','Experimental Result')

saveas(gcf,'375freq.png')