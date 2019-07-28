clc
clear all

a=1;
b=2;
n=20;
h=(b-a)/n;
x=a:h:b;
area =0;

y = 1./((x.^2).*sqrt((x.^2)+1));

area =(h/2)*( sum( y(1:end-1) + y(2:end) ) )    %central approximation

%for i =1:n-1
 %   sum =sum+(h/2)*(y(i)+y(i+1))
%end
