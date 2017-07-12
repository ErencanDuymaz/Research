fileID = fopen('my_file.txt','w');
A1 = [ 0:1:9];
fprintf(fileID,'%6s', A1 );
fclose(fileID);
