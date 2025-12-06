clc; clear; close all;
syms x

% User Input for Data Points (as string)
X_str = input('Enter x values as a space-separated string: ', 's'); % Example: '0 2 3 6 9 10'
Y_str = input('Enter y values as a space-separated string: ', 's'); % Example: '3 7 24 207 714 983'

% Convert input strings to numeric vectors
X = str2num(X_str); %#ok<ST2NM> % Converts string to numeric array
Y = str2num(Y_str); %#ok<ST2NM> 

% Ensure X and Y are row vectors
X = X(:)';
Y = Y(:)';

% Number of data points
n = length(X);

% Step Size h
h = diff(X);

% Coefficient Matrix for M_i
A = zeros(n);  % Matrix for M_i system
b = zeros(n, 1); % RHS vector

% Natural Spline Boundary Conditions (M1 = Mn = 0)
A(1,1) = 1;
A(n,n) = 1;

% Filling the system of equations for M_i
for i = 2:n-1
    A(i, i-1) = h(i-1) / 6;
    A(i, i) = (h(i-1) + h(i)) / 3;
    A(i, i+1) = h(i) / 6;
    b(i) = (Y(i+1) - Y(i)) / h(i) - (Y(i) - Y(i-1)) / h(i-1);
end

% Solving for M values
M = A \ b;

% Display the computed M values
fprintf('\nComputed M values:\n');
disp(array2table(M, 'VariableNames', {'M_values'}));

% Displaying symbolic expressions for M_i
syms Mi_1 Mi Mi1 y_i1 y_i y_im1 h_sym
M_eqn = Mi_1 + 4*Mi + Mi1 == (6/h_sym^2) * (y_im1 - 2*y_i + y_i1);
fprintf('\nSymbolic Expression for M_i:\n');
disp(M_eqn);

% Ask user for value of x to evaluate
x_val_str = input('Enter the value of x for which S(x) is required: ', 's');
x_val = str2double(x_val_str);

% Compute S(x) expressions and evaluate for given x
fprintf('\nCubic Spline Expressions for Each Interval:\n');
for i = 2:n
    % Defining S(x) as per cubic spline formula
    syms S_x
    S_x = (1/(6*h(i-1))) * ((X(i) - x)^3 * M(i-1) + (x - X(i-1))^3 * M(i)) ...
          + (1/h(i-1)) * (X(i) - x) * (Y(i-1) - (h(i-1)^2 / 6) * M(i-1)) ...
          + (1/h(i-1)) * (x - X(i-1)) * (Y(i) - (h(i-1)^2 / 6) * M(i));

    fprintf('\nS(x) in Interval [%g, %g]:\n', X(i-1), X(i));
    disp(S_x);
    
    % If x_val is within the interval, evaluate S(x)
    if X(i-1) <= x_val && x_val <= X(i)
        S_value = double(subs(S_x, x, x_val));
        fprintf('\nS(%g) = %.6f\n', x_val, S_value);
        break;
    end
end
