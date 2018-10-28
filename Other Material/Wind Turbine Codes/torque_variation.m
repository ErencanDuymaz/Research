Cpp=[];
tip=[];
for i = 0.1:0.01:15
    
Cptemp=powercoefficient(i,0);
Cpptemp=Cptemp/i;
Cpp= [ Cpp Cpptemp];
tip= [ tip i ];
end

plot(tip,Cpp)