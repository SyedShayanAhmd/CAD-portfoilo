clc,clear
X = [61072.56 48858.04 34898.6 20357.52 16286.06].*10^-9;
Y1 = [80 100 180 270 280.5].*10^-3;

n=[54.9 54.9 42 49.9 57]
% Fit a polynomial curve of degree 2 to the data
p1 = polyfit(X, Y1, 2);

p4 = polyfit(X, n, 2);
x_fit = linspace(0, max(X), 100); % Create a finer grid of x values for the fitted curve
y_fit1 = polyval(p1, x_fit); % Evaluate the polynomial at the finer grid of x values

y_fit4 = polyval(p4, x_fit); % Evaluate the polynomial at the finer grid of x values
% Plot the data points and the fitted curve
yyaxis left;
plot(X, Y1, 'o', x_fit, y_fit1, '-');
ylabel('Experimental values of head');
title('Dual Y-axis Plot');
% Plot on the right y-axis
yyaxis right;
plot(X, n, 'x', x_fit, y_fit4, '--');
ylabel('Y4');
xlabel('Flow Rate');
ylabel('Efficiency');
ylim([0 100]);
title('Characteristic Curve of Centrifugal Pump with Best Fit Polynomial');
legend('Data Points', 'Best Fit Curve');
