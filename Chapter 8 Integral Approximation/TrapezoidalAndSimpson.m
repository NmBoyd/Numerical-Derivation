clc
clear
a = 1;
b =2;
n = 6; %when odd, the simpsons rule is larger than the trapezoidal rule becauase it neglects the last term
h = (b-a)/n;
x=a:h:b;

y = 1./((x.^2 ).*sqrt(x.^2 +1));
%---------------------------------------------------------
I_trpz = (h/2)*(sum(y(1:end-1) + y(2:end)));
I_true = 2^(1/2)-5^(1/2)/2;
error_trpz = abs(I_trpz-I_true)/I_true;
%-------------------------------------------------------------
I_simpson = (h/3)*(y(1) +4*sum(y(2:2:end))+2*sum(y(3:2:end-1))+y(end));
error_simpson = abs(I_simpson-I_true)/I_true;
%------------------------------------------------------------
fprintf('The relative error of Trapezoidal Rule is %.2f%%\n',error_trpz*100);

fprintf('The relative error of Simpsons Rule is %.2f%%\n',error_simpson*100);