time=xlsread('375W new.xlsx','H265:H1024');
freqex=xlsread('375W new.xlsx','B265:B1024');


plot(time,freqex, '--k','LineWidth',2)

hold on

time2=xlsread('375W new.xlsx','F2:F6002');
freqsim=xlsread('375W new.xlsx','G2:G6002');

plot(time2,freqsim,'k','LineWidth',2)


xlabel('Time(s)')
ylabel('Frequency (Hz)')
ax = gca;
ax.XGrid = 'on';
set(gca,'FontSize',14);
% grid minor
ax.YGrid = 'on';
xlim([0 30])
ylim([48 50.25])

legend('Experimental Result','Simulation Result')

saveas(gcf,'375freq.png')