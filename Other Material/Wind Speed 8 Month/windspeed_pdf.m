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

% 
Q_low = trapz(x,y2)

%%
clear all
clc
filename = 'wind speeds.xlsx';
sheet = 1;
xlRange = 'B2:B33160';

[num,txt] = xlsread(filename,sheet,xlRange);
windspeeds =[];
windspeeds2=num;
clear vars filename shhet txt xlRange num sheet

for i=1:numel(windspeeds2)
   if windspeeds2(i)>=3
   windspeeds=[ windspeeds; windspeeds2(i)];
   end
    
end

meancik=mean(windspeeds);
varcik=sqrt(var(windspeeds));
x=min(windspeeds):0.0001:max(windspeeds);

pd=fitdist(windspeeds,'Normal')
y=pdf(pd,x);
plot(x,y,'LineWidth',2)
% vline = refline([0 meancik]);
% vline.Color = 'r';

% %Low wind i�in
% x1=min(windspeeds):0.001:meancik-varcik;
% y=pdf(pd,x1);
% Q_low = trapz(x1,y)
% 
% 
% %Medium wind i�in
% x2=meancik-varcik:0.001:meancik+varcik;
% y=pdf(pd,x2);
% Q_med = trapz(x2,y)
% 
% 
% %High wind i�in
% x3=10.5:0.001:max(windspeeds);
% y=pdf(pd,x3);
% Q_max = trapz(x3,y)
% 
% 
% x=min(windspeeds):0.001:10;
% y=pdf(pd,x);
% Q_10=trapz(x,y)
% 
% x_cutoff=min(windspeeds):0.001:3;
% y=pdf(pd,x_cutoff);
% Q_cutoff=trapz(x_cutoff,y)


xlabel('Wind Speeds (m/s)')
ylabel('Probability Density Function')
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
grid minor
xlim([min(x) max(x)])
set(gca,'FontSize',20);

%%
filename = 'wind speeds.xlsx';
sheet = 7;
xlRange = 'G1:G172';

[num,txt] = xlsread(filename,sheet,xlRange);
delpi=num;
clear vars filename shhet txt xlRange num sheet

filename = 'wind speeds.xlsx';
sheet = 7;
xlRange = 'A1:A172';

[num,txt] = xlsread(filename,sheet,xlRange);
windpi=num;
clear vars filename shhet txt xlRange num sheet

%%

delpower=interp1(windpi,delpi,x);
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
area=trapz(x,new_var)