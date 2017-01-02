% fileID = fopen('newfile.txt','w');
% A1 = [ 0 ,1 ,2, 3 ,4 ,5 ,6 ,7 ,8 ,9 ]
% fprintf(fileID, '%s' , 'Name Type');
% fprintf(fileID, '%s','\n');
% fprintf(fileID, '%s' , 'Name Type');
% fprintf(fileID, '%s' , 'fsdfd');
% fclose(fileID);

% temp = '78 72 64 66 49';
% fileID = fopen('temp.txt','w+');
% fprintf(fAileID, '%s', temp);
% fclose(fileID);

% fileID = fopen('temp.txt');
% A = fscanf(fileID, '%f %c', [2 inf]);
% fclose(fileID);
% char(A(2,:))

fileID = fopen('temp.txt');
B = textscan(fileID, '%0.2f %c');
