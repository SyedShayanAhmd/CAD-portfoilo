clc,clear
n=1.3;
r=linspace(0,1,10000);
g=9.81;
p1=5.5e5;
V1=0.292;
A = pi*(6.3e-3)^2/4; 
m=A*sqrt(2*n/(n-1)*(5.5e-5/0.29).*r.^(2/n).*(1-r.^((n-1)./n)));
plot(r,m)