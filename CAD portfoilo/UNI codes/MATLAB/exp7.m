clc,clear
% Given data
R = log([7, 10, 20, 30, 40, 50]);
T1 = [49.5 45.3 40.2 35.9 34.9 32.9];
T2 = [62, 56.8, 47.7, 39.9, 37.2, 33.9];
T3 = [77.3, 67.9, 55.1, 43.9, 43.2, 35.3];

% Plot the data points
plot(R, T1, 'bo', 'MarkerSize', 8);
hold on;
plot(R, T2, 'rs', 'MarkerSize', 8);
plot(R, T3, 'gd', 'MarkerSize', 8);

% Perform logarithmic curve fitting for each data set and plot
for i = 1:3
    % Perform curve fitting
    coefficients = polyfit(R, eval(['T', num2str(i)]), 1);
    
    % Extract coefficients
    a = coefficients(1); % slope
    b = coefficients(2); % intercept
    
    % Create the equation
    syms x
    equation = a * x + b;
    
    % Generate values using the equation
    R_fit = linspace(min(R), max(R), 100);
    T_fit = a * R_fit + b;
    
    % Plot the fitted curve
    plot(R_fit, T_fit, '-', 'LineWidth', 1.5);
        
    % Display the equation
    disp(['Equation for T', num2str(i), ': T = ', char(equation)]);
end

% Customize the plot
xlabel('R');
ylabel('T');
title('Curve Fitting for T1, T2, and T3');
legend('T1', 'T2', 'T3', 'Location', 'best');
grid on;
