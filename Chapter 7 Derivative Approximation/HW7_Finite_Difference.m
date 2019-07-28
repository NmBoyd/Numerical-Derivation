clc
clear all

dx = 0.02;
x = 0:dx:1;

y_anal = (1.5.*x)./((1+x.^2).^2);

%second derivative of first order
d2ydx2 = ((36.*x.^3)./(x.^2 +1).^4) -((18.*x)./(x.^2 +1).^3);
%forward diff 1st order
fd_d2ydx2 = (y_anal(3:end)-2*y_anal(2:end-1)+y_anal(1:end-2))/(dx^2);

%backward diff 1st order
bd_d2ydx2 = (y_anal(3:end)-2*y_anal(2:end-1)+y_anal(1:end-2))/(dx)^2;

%central diff 2nd order
cd_d2ydx2 = (-y_anal(5:end)+16*y_anal(4:end-1)-30*y_anal(3:end-2)+16*y_anal(2:end-3)-y_anal(1:end-4))/(12*dx^2);

plot(x,d2ydx2,x(3:end),fd_d2ydx2,'x',x(1:end-2),bd_d2ydx2,'o',x(3:end-2),cd_d2ydx2,'+');
legend('Analytical Graph','y" FD Approx','y" BD Approx','y" CD Approx','location','southeast');
grid on