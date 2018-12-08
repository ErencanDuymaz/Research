Cpp=[];
tip=[];
for i = 0.1:0.01:15
    
Cptemp=powercoefficient(i,0);
Cpptemp=Cptemp/i;
Cpp= [ Cpp Cpptemp];
tip= [ tip i ];
end
a=max(Cpp);
plot(tip,Cpp/a,'LineWidth',2)
xlabel('Tip Speed Ratio')
ylabel('Torque (pu)')
ax = gca;
ax.XGrid = 'on';
set(gca,'FontSize',15);
grid minor
ylim([0 1.05])
saveas(gcf,'torquevariation','pdf')