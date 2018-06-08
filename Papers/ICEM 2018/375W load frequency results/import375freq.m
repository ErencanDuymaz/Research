time=xlsread('datafreqq375.csv','A1:A2502');
freq=xlsread('datafreqq375.csv','B1:B2502');

plot(time,freq, '--k','LineWidth',2)

hold on

freq2=xlsread('40000 msec freq 8+1_2.xlsx','B135:B229');
time2=xlsread('40000 msec freq 8+1_2.xlsx','F135:F229');

plot(time2,freq2,'k','LineWidth',2)


xlabel('Time(s)')
ylabel('Frequency (Hz)')
ax = gca;
ax.XGrid = 'on';
set(gca,'FontSize',14);
% grid minor
ax.YGrid = 'on';
xlim([0 25])
ylim([48 50.5])

legend('Simulation Result','Experimental Result')

saveas(gcf,'375freq.png')