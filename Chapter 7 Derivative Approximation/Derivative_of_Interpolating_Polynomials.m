clc
clear all

%a,ar,ar^2,ar^3,ar^4,...
%sum = a(1-r^n)/(1-r)

L = 2;      %length of the graph
n = 21;     %number of nodes
r = 1.25;   %arbitrary constant
dx1 = L*(1-r)/(1-r^(n-1));  %1st interval dx, coming from sum of geometric progression
dx = dx1*r.^(0:n-2);        %dx is the original interval, followed by dx*r^(0->19) for 20 elements
x = zeros(1,n);
for i = 2:1:n
    %x2 = dx1; x3 = dx1+dx2; .....
    x(1,i) = sum(dx(1:i-1));
end
sum(dx)     %since sum =2, we know the displacements are correct

y = (1.5.*x)./(1+x.^2).^2;

dydx = 3./(2*(x.^2 + 1).^2) - (6*x.^2)./(x.^2 + 1).^3;     %derivative from diff(y,1)
d2ydx2 = (36*x.^3)./(x.^2 + 1).^4 - (18.*x)./(x.^2 + 1).^3; %second deriv from diff(y,2)

inter_dydx = (y(3:end)+(r^2-1).*y(2:end-1)-r^2.*y(1:end-2))./(dx(1:end-1).*(r+r^2));
inter_d2ydx2 = (2.*(y(3:end)-(r+1).*y(2:end-1)+r.*y(1:end-2)))./(dx(1:end-1).^2*(r^2+r));

plot(x,dydx,x(2:end-1),inter_dydx,'x');
legend('Analytical f'' ','Numerical f'' ');
title('Graph of f''');
grid on
figure;

plot(x,d2ydx2,x(2:end-1),inter_d2ydx2,'x');
legend('Analytical f"','Numerical f"','location','southeast');
title('Graph of f"');
grid on
figure; 

plot(x,dydx,x(2:end-1),inter_dydx,'x',x,d2ydx2,x(2:end-1),inter_d2ydx2,'o');
legend('Analytical f''','Numerical f''','Analytical f"','Numerical f"','location','southeast');
title('Graph of f" and f''');
grid on
