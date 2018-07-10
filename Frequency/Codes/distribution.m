pd = fitdist(freq,'Normal');
min=min(freq);
max=max(freq);

x=min:0.001:max;
y=pdf(pd,x);
plot(x,y)