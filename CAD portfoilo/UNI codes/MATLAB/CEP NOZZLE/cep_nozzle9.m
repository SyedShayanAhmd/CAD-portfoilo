clear,clc
t=linspace(0,10,1000);
m=pi*(6.5*10^(-3))^2/4.*sqrt(2*9.81*5.5*10^5*0.9965).*sqrt(t./(t-1).*((2./(t+1)).^(2./(t+1)).*(1-2./(t+1))));
r=(2./(t+1)).^(t./(t-1));
plot(r,m)
hold on
for i=1:length(m)-1
    if m(i+1) < m(i)
        break;
    end
end
x=r(i);
y=m(i);
plot(x,y,'ro')
xlabel('r')
ylabel('m')
legend('m','Point where m starts to decrease')