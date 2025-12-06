clear, clc
A = pi*6.3e-3/4;  
t = 1:0.01:3;  
T1_values = [1 2 3];  % Try different values of T1

for i = 1:length(T1_values)
    T1 = T1_values(i);
    fplot(@(t) eq1(t, A, T1), @(t) eq2(t), t);
    hold on;
end

xlabel('m (mass flow)');
ylabel('P2/P1 (pressure ratio)');
title('Parametric Plot of Equations with Varying T1');
legend('T1 = 1', 'T1 = 2', 'T1 = 3');