clear all
close all

for k = 12:16
    for l = 1:12
        for m = 1:28
            isim = ['mi',int2str(k),int2str(l),int2str(m),'.bin'];
            fileID = fopen(isim);
            A=fread(fileID,'uint16');
            fclose(fileID);
            
            boy=length(A)/99;
            
            for i=1:boy
                asd1(i)=A(99*(i-1)+36); %7 de bir tekrarliyor
                asd2(i)=A(99*(i-1)+45);
                asd3(i)=A(99*(i-1)+50);
                asd4(i)=A(99*(i-1)+57);
                asd5(i)=A(99*(i-1)+63);
                asd6(i)=A(99*(i-1)+72);
                asd7(i)=A(99*(i-1)+77);
                asd8(i)=A(99*(i-1)+84);
                asd9(i)=A(99*(i-1)+91);
                asd10(i)=A(99*(i-1)+28);
            end
            
            plot(asd1)
            hold all
            plot(asd2)
            plot(asd3)
            plot(asd4)
            plot(asd5)
            plot(asd6)
            plot(asd7)
            plot(asd8)
            plot(asd9)
            plot(asd10)
        end
    end
end