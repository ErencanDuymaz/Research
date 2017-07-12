
 A = linspace(0,1,1000);
 A1 = A.';
 B = sin(2*pi*100*A);
 B1 = B.';
 x = zeros ( 1000,2);
 x(:,1)= A1;
 x(:,2)= B1;


xlswrite('my_file3.xslx',x);
 
% plot(A1,B1);
% hold on
 C = linspace(0.1,0.14,40);
C1 = C.';
 D = sin(2*pi*100*C);
 D1 = D.';
 y = zeros ( 40,2);
 y(:,1)= C1;
 y(:,2)= D1;
%  plot(C1,D1);
 grid('on');
 plot(A1,B1,C1,D1);