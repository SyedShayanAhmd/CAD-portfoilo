clc,clear
n=1.3;
r=linspace(0.3,1,10000);
g=9.81;
p11=5.5e5;
p12=7e5;
V11=0.273;
V12=0.361;
V2=linspace(1,0.25,10000);
A = pi*((6.48e-3)^2)/4;
m11=(A./(V2)).*sqrt((2*n./(n-1)).*(p11/V11).*(1-r.^((n-1)./n)));
m22=(A./(V2)).*sqrt((2*n./(n-1)).*(p12/V12).*(1-r.^((n-1)./n)));
plot(r,m11,r,m22,"DisplayName","nozzle 3");