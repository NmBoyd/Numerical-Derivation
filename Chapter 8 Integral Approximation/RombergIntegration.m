clc
clear
%define parameters
a=1;
b=2;
m=4;
R=zeros(m,m);   %m x m matrix
%fill matrix with values
for i =1:m
    n = 2^(i-1);
    h = (b-a)/(n);
    x=a:h:b;
    y = 1./((x.^2).*sqrt((x.^2)+1));
    R(i,1) = (h/2)*(sum(y(1:end-1) + y(2:end)));    % calculate trapezoidal rule for all
    for j = 2:i
      R(i,j)=((4^(j-1))*R(i,j-1)-R(i-1,j-1))/((4^(j-1))-1); %replace trapezoidal calcs with Richarsons
    end
end
I_True = sqrt(2)-sqrt(5)/2;
error_Romberg = abs(R(m,m)-I_True)/I_True;
fprintf('The relative error of Romberg Integration is %.5f%%\n',error_Romberg*100);