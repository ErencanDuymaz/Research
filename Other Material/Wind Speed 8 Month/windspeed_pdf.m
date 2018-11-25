clear all
clc
filename = 'wind speeds.xlsx';
sheet = 1;
xlRange = 'B2:B33160';

[num,txt] = xlsread(filename,sheet,xlRange);
windspeeds=num;
clear vars filename shhet txt xlRange num sheet

%%
meancik=mean(windspeeds);
varcik=sqrt(var(windspeeds));
% x=min(windspeeds):0.001:max(windspeeds);
x=sort(windspeeds);
pd=fitdist(windspeeds,'Normal')
% y=pdf(pd,x);
% plot(x,y,'LineWidth',2)

y2 = cdf(pd,x); 
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

%Low wind için
x1=min(windspeeds):0.001:meancik-varcik;
y=pdf(pd,x1);
Q_low = trapz(x1,y)


%Medium wind için
x2=meancik-varcik:0.001:meancik+varcik;
y=pdf(pd,x2);
Q_med = trapz(x2,y)


%High wind için
x3=10.5:0.001:max(windspeeds);
y=pdf(pd,x3);
Q_max = trapz(x3,y)


x=min(windspeeds):0.001:10;
y=pdf(pd,x);
Q_10=trapz(x,y)

x_cutoff=min(windspeeds):0.001:3;
y=pdf(pd,x_cutoff);
Q_cutoff=trapz(x_cutoff,y)


xlabel('Wind Speeds (m/s)')
ylabel('Probability Density Function')
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
grid minor
set(gca,'FontSize',20);