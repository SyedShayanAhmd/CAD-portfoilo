clc; clear; close all;
syms x;

% Input Data Points as Strings
x_str = input('Enter x values as space-separated string: ', 's');
y_str = input('Enter f(x) values as space-separated string: ', 's');
dy_str = input('Enter f''(x) values as space-separated string: ', 's');

% Convert input strings to numerical arrays
x_vals = str2double(strsplit(x_str));
y_vals = str2double(strsplit(y_str));
dy_vals = str2double(strsplit(dy_str));
n = length(x_vals);

% Compute Lagrange Basis Polynomials L_i(x)
LagrangeBasis = sym(zeros(n, 1));
for i = 1:n
    L = 1;
    for j = 1:n
        if j ~= i
            L = L * (x - x_vals(j)) / (x_vals(i) - x_vals(j));
        end
    end
    LagrangeBasis(i) = expand(L);
end

% Compute A_i(x) and B_i(x) values
A = sym(zeros(n, 1));
B = sym(zeros(n, 1));

fprintf('\nA_i(x) and B_i(x) values:\n');
for i = 1:n
    L_i = LagrangeBasis(i);
    L_i_derivative = diff(L_i, x);
    A(i) = expand((1 - 2 * subs(L_i_derivative, x, x_vals(i)) * (x - x_vals(i))) * L_i^2);
    B(i) = expand((x - x_vals(i)) * L_i^2);
    
    fprintf('\nFor i = %d:\n', i-1);
    fprintf('L_%d(x) = %s\n', i-1, char(L_i));
    fprintf('A_%d(x) = %s\n', i-1, char(A(i)));
    fprintf('B_%d(x) = %s\n', i-1, char(B(i)));
end

% Construct the final Hermite interpolating polynomial
HermitePoly = 0;
for i = 1:n
    HermitePoly = HermitePoly + y_vals(i) * A(i) + dy_vals(i) * B(i);
end
HermitePoly = expand(HermitePoly);

fprintf('\nFinal Hermite Interpolating Polynomial:\n');
disp(HermitePoly);

% Ask for interpolation point
x_interp = input('\nEnter x value for interpolation: ');

% Evaluate A_i, B_i, and final Hermite polynomial at given x value
fprintf('\nComputed Values at x = %.4f:\n', x_interp);
interp_value = double(subs(HermitePoly, x, x_interp));

for i = 1:n
    A_i_value = double(subs(A(i), x, x_interp));
    B_i_value = double(subs(B(i), x, x_interp));
    fprintf('A_%d(%.4f) = %.6f\n', i-1, x_interp, A_i_value);
    fprintf('B_%d(%.4f) = %.6f\n', i-1, x_interp, B_i_value);
end

fprintf('\nHermite Interpolated Value at x = %.4f: %.6f\n', x_interp, interp_value);
