clc,clear

X = [4.20E-04
5.00E-04
5.30E-04
6.25E-04
7.00E-04
7.50E-04
];
Y1 = [0.66
0.61
0.53
0.4
0.27
0.24
];
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
p2 = polyfit(X, Y2, 2);
p3 = polyfit(X, Y3, 2);
p4 = polyfit(X, Y4, 2);
x_fit = linspace(0, max(X), 100); % Create a finer grid of x values for the fitted curve
y_fit1 = polyval(p1, x_fit); % Evaluate the polynomial at the finer grid of x values
y_fit2 = polyval(p2, x_fit); % Evaluate the polynomial at the finer grid of x values
y_fit3 = polyval(p3, x_fit); % Evaluate the polynomial at the finer grid of x values
y_fit4 = polyval(p4, x_fit); % Evaluate the polynomial at the finer grid of x values

% Plot the data points and the fitted curve
plot(X, Y4, 'o', x_fit, y_fit4, X,Y4,'X',x_fit, y_fit4);
xlabel('Flow Rate');
ylabel('NPSHa');
title('Characteristic Curve of Centrifugal Pump with Best Fit Polynomial');
legend('Data Points', 'Best Fit Curve', 'Location', 'northwest');
