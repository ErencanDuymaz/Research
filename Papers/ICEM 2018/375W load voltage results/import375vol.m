time=xlsread('datavol375.csv','A1:A1501');
vol1=xlsread('datavol375.csv','B1:B1501');
vol=vol1*380;

plot(time,vol, '--k','LineWidth',2)

hold on

time2=xlsread('voltage 8+1.xlsx','E10:E72');
vol2=xlsread('voltage 8+1.xlsx','F10:F72');

plot(time2,vol2,'k','LineWidth',2)


xlabel('Time(s)')
ylabel('Frequency (Hz)')
ax = gca;
ax.XGrid = 'on';
set(gca,'FontSize',14);
% grid minor
ax.YGrid = 'on';
xlim([2.5 12.5])
ylim([360 400])

legend('Simulation Result','Experimental Result')

saveas(gcf,'375vol.png')