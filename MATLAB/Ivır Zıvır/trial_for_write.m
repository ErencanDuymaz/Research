fileID = fopen('newtextdoc.txt','w');
fprintf(fileID, '%s' ,'Number');
A1 = [ 41;42;34;44;45;46 ];
fprintf(fileID, '%2.1f' ,A1);
fclose(fileID);