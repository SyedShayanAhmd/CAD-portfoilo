clc,clear
X = [61072.56 48858.04 34898.6 20357.52 16286.06].*10^-9;
Y1 = [80 100 180 270 280.5].*10^-3;
Y2=[0.870
0.780
0.590
0.350
0.244
0.221
];
Y3=[9.93E+00
9.85E+00
9.82E+00
9.69E+00
9.58E+00
9.49E+00
];
Y4=[9.93E+00
9.85E+00
9.82E+00
9.69E+00
9.58E+00
9.49E+00
]
% Fit a polynomial curve of degree 2 to the data
p1 = polyfit(X, Y1, 2);

x_fit = linspace(0, max(X), 100); % Create a finer grid of x values for the fitted curve
y_fit1 = polyval(p1, x_fit); % Evaluate the polynomial at the finer grid of x values

% Plot the data points and the fitted curve
plot(X, Y1, 'o', x_fit, y_fit1, X,Y1,'X',x_fit, y_fit1);
xlabel('Flow Rate');
ylabel('NPSHa');
title('Characteristic Curve of Centrifugal Pump with Best Fit Polynomial');
legend('Data Points', 'Best Fit Curve', 'Location', 'northwest');