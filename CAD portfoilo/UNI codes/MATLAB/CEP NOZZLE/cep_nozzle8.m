clear,clc
t=linspace(0,10,1000);
m=pi*(6.5*10^(-3))^2/4.*sqrt(2*9.81*5.5*10^5*0.9965).*sqrt(t./(t-1).*((2./(t+1)).^(2./(t+1)).*(1-2./(t+1))));
r=(2./(t+1)).^(t./(t-1));
plot(r,m)
hold on
m_target = 0.5/97;

for i=1:length(m)-1
    if abs(m(i+1) - m_target) > abs(m(i) - m_target)
        break;
    end
end

r1 = r(i);
r2 = r(i+1);

plot([r1, r2], [m_target, m_target], 'k--')
xlabel('r')
ylabel('m')
legend('m','Point where m is within a certain range of 0.5/97 kg/sec')