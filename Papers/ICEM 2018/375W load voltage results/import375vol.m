time=xlsread('datavol375.csv','A1:A1501');
vol1=xlsread('datavol375.csv','B1:B1501');
vol=vol1*380;

plot(time,vol, '--k','LineWidth',2)

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

saveas(gcf,'375vol.png')