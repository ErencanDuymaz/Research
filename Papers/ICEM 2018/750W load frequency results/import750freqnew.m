
time2=xlsread('750W new.xlsx','D2:D6002');
freqsim=xlsread('750W new.xlsx','E2:E6002');

plot(time,freqex, 'r','LineWidth',1.5)

hold on
time=xlsread('750W new.xlsx','G2:G534');
freqex=xlsread('750W new.xlsx','F2:F534');

plot(time2,freqsim,'--k','LineWidth',1.5)


xlabel('Time(s)')
ylabel('Frequency (Hz)')
ax = gca;
ax.XGrid = 'on';
set(gca,'FontSize',14);
grid minor
ax.YGrid = 'on';
xlim([0 30])
ylim([47 50.25])

legend('Experimental Result','Simulation Result')

saveas(gcf,'750freq.png')