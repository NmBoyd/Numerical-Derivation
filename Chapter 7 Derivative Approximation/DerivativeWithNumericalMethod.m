clc
clear
dx =1;
x=0:dx:10;
y = sin(x)+x.^2;    %original function
dydx = cos(x)+2*x;  %analytical 1st order derivative

fd_dydx = (y(2:end)-y(1:end-1))/dx;   %forward difference for the derivative using matrices instead of loop
bd_dydx = diff(y)/dx;   %backward difference approximation for the derivative
cd_dydx = (y(3:end)-y(1:end-2))/(2*dx);

%x shifts the graph forward/backward. x starts and ends at different points
%so the fd and bd graphs appear on each side of the analytical plot.
plot(x,dydx,x(1:end-1),fd_dydx,':',x(2:end),bd_dydx,'--',x(2:end-1),cd_dydx,'r','linewidth',2); 

legend('Analytical','FD','BD','CD','location','northwest');
grid on;