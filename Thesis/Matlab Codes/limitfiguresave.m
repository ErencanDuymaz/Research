
hold on all
%Measurement
% plot(power_100)
plot(power)
plot(power1)

%%
%Calculation =Tw
hold on all
% plot(power1_100)
plot(power1_1000)
plot(power1_2000)

%%
%%
%Calculation =Tw
hold on all
% plot(power1_100)
plot(vdc_1000/1200,'LineWidth',2)
% plot(vdc_1000/1200,'LineWidth',2)

xlabel('Time(s)')
ylabel('Dc-Link Voltage(pu)')
ax = gca;
ax.XGrid = 'on';
set(gca,'FontSize',20);
grid minor
title('')
% legend('','')
xlim([9.95 10.25])
ylim([0.95 1.05])

%%
%Calculation =Tw
hold on all
% plot(power1_100)
plot(Te_1000/(2.75e6/(1735*pi*2/60)),'LineWidth',2)
plot(power1_1000/(2.75e6),'LineWidth',2)

xlabel('Time(s)')
ylabel('Te,Pgrid(pu)')
ax = gca;
ax.XGrid = 'on';
set(gca,'FontSize',20);
grid minor
title('')
legend('Electromagnetic Torque','Active Power')
xlim([9.75 11.5])
ylim([0 1.2])

%%
%Calculation =Tw

% plot(power1_100)
subplot(2,1,1);
plot(powertur_2000/(2.75e6),'LineWidth',2)
hold on
plot(power_2000/(2.75e6),'LineWidth',2)



xlabel('Time(s)')
ylabel('Ptur,Pgen(pu)')
ax = gca;
ax.XGrid = 'on';
set(gca,'FontSize',20);
grid minor
title('')
legend('Turbine Power','Generator Power')
xlim([9.75 11.5])
ylim([0 0.4])

subplot(2,1,2);
plot(speed_2000/(1735*2*pi/60),'LineWidth',2)


xlabel('Time(s)')
ylabel('Generator Speed(pu)')
ax = gca;
ax.XGrid = 'on';
set(gca,'FontSize',20);
grid minor
title('')
% legend('Electromagnetic Torque','Active Power')
xlim([9.75 11.5])
ylim([0.225 0.325])