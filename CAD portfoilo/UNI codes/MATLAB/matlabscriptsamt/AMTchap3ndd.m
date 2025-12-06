clc; clear; close all;

% Input Data Points as Strings
x_str = input('Enter x values as space-separated string: ', 's');
y_str = input('Enter f(x) values as space-separated string: ', 's');

x = str2double(strsplit(x_str));
y = str2double(strsplit(y_str));
n = length(x);

% Initialize divided difference table
diff_table = zeros(n, n);
diff_table(:,1) = y';

% Generate the divided difference table
for j = 2:n
    for i = 1:(n-j+1)
        diff_table(i,j) = (diff_table(i+1,j-1) - diff_table(i,j-1)) / (x(i+j-1) - x(i));
    end
end

% Display Divided Difference Table
disp('Divided Difference Table:');
disp(diff_table);

% Construct the Newton Divided Difference Polynomial
syms X;
newton_poly = diff_table(1,1);
poly_expr = sprintf('%.4f', diff_table(1,1));
term_expr = 1;

for i = 2:n
    term_expr = term_expr * (X - x(i-1));
    newton_poly = newton_poly + diff_table(1,i) * term_expr;
    poly_expr = sprintf('%s + (%.4f)*(X - %.4f)', poly_expr, diff_table(1,i), x(i-1));
end

disp('Newton Divided Difference Polynomial Expression:');
disp(vpa(expand(newton_poly), 4));
disp(['Polynomial Form: ', poly_expr]);

% Interpolation point
x_interp = input('Enter x value for interpolation: ');

% Evaluate the polynomial at the given point
interp_value = double(subs(newton_poly, X, x_interp));
disp(['Newton Divided Difference Interpolated value at x = ', num2str(x_interp), ' is ', num2str(interp_value)]);
