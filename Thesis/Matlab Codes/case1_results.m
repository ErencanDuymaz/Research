hold on all 

freq11=(freq1/(freq1.data(1000000)))*50;
% freq22=(freq2/(freq2.data(1000000)))*50;
% freq33=(freq3/(freq3.data(1000000)))*50;
% 
plot(freq11,'LineWidth',1)
% plot(freq22,'LineWidth',1)
% plot(freq33,'LineWidth',1)

pllfreq55=(pllfreq5/(pllfreq5.data(1000000)))*50;
pllfreq66=(pllfreq6/(pllfreq6.data(1000000)))*50;
% pllfreq88=(pllfreq8/(pllfreq8.data(1000000)))*50;
plot(pllfreq55,'LineWidth',1)
plot(pllfreq66,'LineWidth',1)
% plot(pllfreq88,'LineWidth',1)

xlabel('Time(s)')
ylabel('Frequency(Hz)')
ax = gca;
ax.XGrid = 'on';
set(gca,'FontSize',15);
grid minor
xlim([9.5 15])
ylim([49.75 50.05])
% legend('Generator 1','Generator 2','Generator 3')
legend('Generator 1','Load A','Load B')
% legend('Generator 1','Generator 2','Generator 3','Load A','Load B','Load C')
% saveas(gcf,'All_Freq.png')
% saveas(gcf,'Case1_Generator_Freq.png')
% saveas(gcf,'Case1_Load_Freq_line1.png')
saveas(gcf,'Case1_Load_Gen_Freq.png')