clear all
clc
filename = 'wind speeds.xlsx';
sheet = 1;
xlRange = 'B2:B33160';

[num,txt] = xlsread(filename,sheet,xlRange);
windspeeds=num;
clear vars filename shhet txt xlRange num sheet

%%
% meancik=mean(windspeeds);
% varcik=sqrt(var(windspeeds));
% x=min(windspeeds):0.001:max(windspeeds);
x=sort(windspeeds);
pd=fitdist(windspeeds,'Normal')
% y=pdf(pd,x);
% plot(x,y,'LineWidth',2)

y2 = pdf(pd,x); 
plot(x,y2,'k','LineWidth',2)


xlabel('Wind Speeds (m/s)')
% ylabel('Cumulative Probability (CDF)')
ylabel('Probability Density Function (PDF)')

ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XColor = 'k'; % Red
ax.YColor = 'k'; % Blue
xlim([min(x) max(x)])
grid minor
set(gca,'FontSize',12);
% saveas(gcf,'pdf_windspeed3','pdf')


%%
filename = 'wind speeds.xlsx';
sheet = 8;
xlRange = 'P1:P197';

[num,txt] = xlsread(filename,sheet,xlRange);
delpi=num;
clear vars filename shhet txt xlRange num sheet

filename = 'wind speeds.xlsx';
sheet = 8;
xlRange = 'A1:A197';

[num,txt] = xlsread(filename,sheet,xlRange);
wind=num;
clear vars filename shhet txt xlRange num sheet

%%

delpower=interp1(wind,delpi,x);
% plot(x,delpower)
new_var=delpower.*y2;
plot(x,new_var,'k','LineWidth',2)
xlim([min(x) max(x)])

xlabel('Wind Speeds (m/s)')
ylabel('Net Power Contribution (pu)')
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XColor = 'k';
ax.YColor = 'k';
grid minor
xlim([min(x) max(x)])
set(gca,'FontSize',10);
% saveas(gcf,'netcontribution','pdf')
area=trapz(x,new_var);