clc; clear; close all;
syms x;

% Input Data Points as Strings
x_str = input('Enter x values as space-separated string: ', 's');
y_str = input('Enter f(x) values as space-separated string: ', 's');

% Convert input strings to numerical arrays
x_vals = str2double(strsplit(x_str));

y_vals = str2double(strsplit(y_str));
n = length(x_vals);

% Construct the Lagrange Polynomial
LagrangePoly = 0; % Initialize polynomial

fprintf('\nLagrange Basis Polynomials:\n');
for i = 1:n
    Li = 1;
    for j = 1:n
        if i ~= j
            Li = Li * (x - x_vals(j)) / (x_vals(i) - x_vals(j));
        end
    end
    fprintf('L%d(x) = %s\n', i-1, char(expand(Li)));
    LagrangePoly = LagrangePoly + Li * y_vals(i);
end

% Expand the polynomial to show final form
LagrangePoly = expand(LagrangePoly);
fprintf('\nFinal Lagrange Polynomial:\nP(x) = %s\n', char(LagrangePoly));

% Ask for interpolation point
x_interp = input('\nEnter x value for interpolation: ');

% Evaluate the polynomial at given x value
interp_value = double(subs(LagrangePoly, x, x_interp));
fprintf('Interpolated value at x = %.4f is %.4f\n', x_interp, interp_value);
