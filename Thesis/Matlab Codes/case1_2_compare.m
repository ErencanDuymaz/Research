hold on all 
% freq11=(freq1/(freq1.data(1000000)))*50;
% freq22=(case2_freq1/(case2_freq1.data(1000000)))*50;
% 
% plot(freq22,'LineWidth',2)
% plot(freq11,'LineWidth',2)
% % 
plot(rocof1,'LineWidth',2)
plot(case2_rocof1,'LineWidth',2)


xlabel('Time(s)')
ylabel('RoCoF(Hz/s)')
ax = gca;
ax.XGrid = 'on';
set(gca,'FontSize',15);
grid minor
xlim([9 15])
ylim([-0.25 0.05])
legend('Base Case RoCoF','Modified Case RoCoF','Location','southeast')
saveas(gcf,'Case1_2_rocof.png')
