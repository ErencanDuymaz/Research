%%
clear all
clc
filename = 'GercekZamanliUretim.xlsx';
sheet = 1;
xlRange = 'D2:D8761';

[num,txt] = xlsread(filename,sheet,xlRange);
storedenergy=num;

clear vars sheet txt xlRange num sheet

filename = 'GercekZamanliUretim.xlsx';
sheet = 1;
xlRange = 'C2:C8761';

[num,txt] = xlsread(filename,sheet,xlRange);
date=num;

filename = 'GercekZamanliUretim.xlsx';
sheet = 1;
xlRange = 'G2:G8761';

ren=xlsread(filename,sheet,xlRange);


t1=datetime(2018,01,01,00,00,00);
t2=datetime(2018,12,31,23,00,00);
time=t1:hours(1):t2;
hold on all
plot(time,storedenergy/1e3,'k','LineWidth',1)
xlim([datenum(2018,01,01,00,00,00) datenum(2018,12,31,23,00,00);])

plot(time,ren/1e3,'r','LineWidth',1)
xlim([datenum(2018,01,01,00,00,00) datenum(2018,12,31,23,00,00);])

xlabel('Time(h)')
ylabel('Real-Time Generation (GW)')
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XColor = 'k'; % Red
ax.YColor = 'k'; % Blue
grid minor
% ylim([0 3.1])
title('')
set(gca,'FontSize',18);
legend('Total Generation','Wind+Solar Generation')
% saveas(gcf,'uretim2','pdf')

%%
clear all
clc
filename = 'GercekZamanliUretim.xlsx';
sheet = 1;
xlRange = 'F2:F8761';

[num,txt] = xlsread(filename,sheet,xlRange);
storedenergy=num;

clear vars sheet txt xlRange num sheet

filename = 'GercekZamanliUretim.xlsx';
sheet = 1;
xlRange = 'C2:C8761';

[num,txt] = xlsread(filename,sheet,xlRange);
date=num;

t1=datetime(2018,01,01,00,00,00);
t2=datetime(2018,12,31,23,00,00);
time=t1:hours(1):t2;

plot(time,storedenergy/1e3,'k','LineWidth',1)
xlim([datenum(2018,01,01,00,00,00) datenum(2018,12,31,23,00,00);])

xlabel('Time(h)')
ylabel('Stored Kinetic Energy (GWs)')
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XColor = 'k'; % Red
ax.YColor = 'k'; % Blue
grid minor
% ylim([0 3.1])
title('')
set(gca,'FontSize',12);
% legend('Power Curve','Accessible Power','Increase in Active Power','Location','best')
saveas(gcf,'stored','pdf')
%%
%%
clear all
clc
filename = 'GercekZamanliUretim.xlsx';
sheet = 1;
xlRange = 'F2:F8761';

[num,txt] = xlsread(filename,sheet,xlRange);
storedenergy=num;

clear vars sheet txt xlRange num sheet

filename = 'GercekZamanliUretim.xlsx';
sheet = 1;
xlRange = 'C2:C8761';

[num,txt] = xlsread(filename,sheet,xlRange);
date=num;

t1=datetime(2018,01,01,00,00,00);
t2=datetime(2018,12,31,23,00,00);
time=t1:hours(1):t2;

plot(time,storedenergy/1e3,'k','LineWidth',1)
xlim([datenum(2018,01,01,00,00,00) datenum(2018,12,31,23,00,00);])

xlabel('Time(h)')
ylabel('Stored Kinetic Energy (GWs)')
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XColor = 'k'; % Red
ax.YColor = 'k'; % Blue
grid minor
% ylim([0 3.1])
title('')
set(gca,'FontSize',12);
% legend('Power Curve','Accessible Power','Increase in Active Power','Location','best')
% saveas(gcf,'stored','pdf')
%% Stored enerji kar��la�t�rmas�
clear all
clc
filename = 'GercekZamanliUretim.xlsx';
sheet = 1;
xlRange = 'F2:F8761';

[num,txt] = xlsread(filename,sheet,xlRange);
h=num;

clear vars sheet txt xlRange num sheet

filename = 'GercekZamanliUretim.xlsx';
sheet = 2;
xlRange = 'E2:E8761';

[num,txt] = xlsread(filename,sheet,xlRange);
h10=num;

clear vars sheet txt xlRange num sheet

filename = 'GercekZamanliUretim.xlsx';
sheet = 1;
xlRange = 'C2:C8761';

[num,txt] = xlsread(filename,sheet,xlRange);
date=num;

t1=datetime(2018,01,01,00,00,00);
t2=datetime(2018,12,31,23,00,00);
time=t1:hours(1):t2;

plot(time,h/1e3,'k','LineWidth',2)
hold on 
plot(time,h10/1e3,'b','LineWidth',2)

xlim([datenum(2018,01,01,00,00,00) datenum(2018,12,31,23,00,00);])

xlabel('Time(h)')
ylabel('Stored Kinetic Energy (GWs)')
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XColor = 'k'; % Red
ax.YColor = 'k'; % Blue
grid minor
% ylim([2.5 5.1])
title('')
set(gca,'FontSize',12);
legend('Existing Stored Energy','Stored Energy with Synthetic Inertia','Location','best')
% saveas(gcf,'newstored','pdf')

%% Inertia Constant Kar��la�t�rmasi

%% Stored enerji kar��la�t�rmas�
clear all
clc
filename = 'GercekZamanliUretim.xlsx';
sheet = 1;
xlRange = 'H2:H8761';

[num,txt] = xlsread(filename,sheet,xlRange);
h=num;

clear vars sheet txt xlRange num sheet

filename = 'GercekZamanliUretim.xlsx';
sheet = 2;
xlRange = 'G2:G8761';

[num,txt] = xlsread(filename,sheet,xlRange);
h10=num;

clear vars sheet txt xlRange num sheet

filename = 'GercekZamanliUretim.xlsx';
sheet = 1;
xlRange = 'C2:C8761';

[num,txt] = xlsread(filename,sheet,xlRange);
date=num;

t1=datetime(2018,01,01,00,00,00);
t2=datetime(2018,12,31,23,00,00);
time=t1:hours(1):t2;

plot(time,h,'k','LineWidth',2)
hold on 
plot(time,h10,'b','LineWidth',2)

xlim([datenum(2018,01,01,00,00,00) datenum(2018,12,31,23,00,00);])

xlabel('Time(h)')
ylabel('Aggregated Inertia Constant(s)')
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XColor = 'k'; % Red
ax.YColor = 'k'; % Blue
grid minor
ylim([2.5 5.1])
title('')
set(gca,'FontSize',12);
legend('Effective Inertia Constant','Inertia Constant with Synthetic Inertia','Location','southeast')
saveas(gcf,'inertia','pdf')