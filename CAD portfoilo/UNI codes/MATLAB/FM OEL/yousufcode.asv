clc,clear
X = [61072.56 48858.04 34898.6 20357.52 16286.06].*10^-9;
Y1 = [80 100 180 270 280.5].*10^-3;


% Fit a polynomial curve of degree 2 to the data
p1 = polyfit(X, Y1, 2);

x_fit = linspace(0, max(X), 100); % Create a finer grid of x values for the fitted curve
y_fit1 = polyval(p1, x_fit); % Evaluate the polynomial at the finer grid of x values

plot(X, Y1, 'o', x_fit, y_fit1);
xlabel('Flow Rate');
ylabel('Head');
title('Characteristic Curve of Centrifugal Pump with Best Fit Polynomial');
legend('Data Points', 'Best Fit Curve', 'Location', 'northwest');
