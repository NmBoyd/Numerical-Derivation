clc
clear all

L = 0.01;
dx = 0.001;
x = 0:dx:L;

N = length(x);
A=zeros(N,N);   %create NxN matrix for A, initial value is zero for all elements
b = zeros(N,1); %create Nx1 b vector, initial value is all zero. 
Tx = (-(10^5)*x.^2)+110;    %analytical solution
%solve for T

%using first order for left boundary has high error. Use second order for
%better curve fit
%f_iPrime = (-f_i+2 + 4*f_i+1 - 3*f_i)/(2*dx)
%A(1,:) = [-1 1 0 0 0 0 0 0 0 0 0]
A(1,:) = [-3 4 -1 0 0 0 0 0 0 0 0];
for i = 2:N-1
   A(i,i-1) = 1;
   A(i,i) = -2;
   A(i,i+1) = 1;
end 
A(11,:) = [0 0 0 0 0 0 0 0 0 0 1];

b(:) = -(2*10^5)*(dx)^2;
b(11) = 100;
b(1) = 0;
b

T = A\b;
plot(x,T,'v',x,Tx);
legend('Finite Difference','Analytical');
hold on
