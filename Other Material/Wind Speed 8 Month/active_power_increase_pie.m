clear all
clc
filename = 'wind speeds.xlsx';
sheet = 4;
xlRange = 'A23:A26';
[num,txt] = xlsread(filename,sheet,xlRange);
xlRange = 'E23:E26';
num= xlsread(filename,sheet,xlRange);

explode = [1 0 0 0];
a=pie(num,explode)
a(2).FontSize=14;
a(4).FontSize=14;
a(6).FontSize=14;
a(8).FontSize=14;
labels=txt';
lgd=legend(labels,'Location','southoutside','Orientation','horizontal');
lgd.FontSize=14;