x = 0:.1:1;
A = [x; exp(x)];

fileID = fopen('my_file.txt','w');
fprintf(fileID,'%6s %12s\n','x','exp(x)');
fprintf(fileID,'%6.2f %12.8f\n',A);
fclose(fileID);