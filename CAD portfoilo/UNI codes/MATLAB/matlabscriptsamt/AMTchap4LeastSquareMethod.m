clc; clear; close all;

% Ask user for the type of curve fitting
disp('Choose the type of curve fitting:');
disp('1: Linear (y = a + bx)');
disp('2: Quadratic (y = a + bx + cx^2)');
disp('3: Power Law (y = ax^b)');
disp('4: Exponential (y = a * b^x)');
disp('5: Exponential with e (y = a * e^(bx))');

choice = input('Enter your choice (1-5): ');

% Input Data Points as Strings and Convert to Numeric Arrays
x_str = input('Enter x values as space-separated numbers: ', 's');
y_str = input('Enter y values as space-separated numbers: ', 's');

x = str2num(x_str); % Convert string to numeric array
y = str2num(y_str);

% Ensure x and y are column vectors
x = x(:);
y = y(:);

% Fit the chosen model
switch choice
    case 1  % Linear: y = a + bx
        X = [ones(length(x),1), x];  % Design matrix
        coeffs = X \ y;  % Solve for a and b
        a = coeffs(1);
        b = coeffs(2);
        y_fit = a + b*x;
        fprintf('Fitted Equation: y = %.4f + %.4fx\n', a, b);

    case 2  % Quadratic: y = a + bx + cx^2
        X = [ones(length(x),1), x, x.^2];  % Design matrix
        coeffs = X \ y;  % Solve for a, b, and c
        a = coeffs(1);
        b = coeffs(2);
        c = coeffs(3);
        y_fit = a + b*x + c*x.^2;
        fprintf('Fitted Equation: y = %.4f + %.4fx + %.4fx^2\n', a, b, c);

    case 3  % Power Law: y = ax^b  (log-linear transformation)
        log_x = log(x);
        log_y = log(y);
        X = [ones(length(log_x),1), log_x];  
        coeffs = X \ log_y;  
        a = exp(coeffs(1));  % Convert back from log-space
        b = coeffs(2);
        y_fit = a * x.^b;
        fprintf('Fitted Equation: y = %.4fx^%.4f\n', a, b);

    case 4  % Exponential: y = a * b^x (log transformation)
        log_y = log(y);
        X = [ones(length(x),1), x];
        coeffs = X \ log_y;  
        a = exp(coeffs(1));  % Convert back from log-space
        b = exp(coeffs(2));
        y_fit = a * b.^x;
        fprintf('Fitted Equation: y = %.4f * %.4f^x\n', a, b);

    case 5  % Exponential with e: y = a * e^(bx)
        log_y = log(y);
        X = [ones(length(x),1), x];
        coeffs = X \ log_y;  
        a = exp(coeffs(1));  % Convert back from log-space
        b = coeffs(2);
        y_fit = a * exp(b*x);
        fprintf('Fitted Equation: y = %.4f * e^(%.4fx)\n', a, b);

    otherwise
        error('Invalid choice. Please run the script again and enter a number between 1 and 5.');
end

% Plot the original data and fitted curve
figure;
scatter(x, y, 'ro', 'filled'); hold on;
plot(x, y_fit, 'b-', 'LineWidth', 2);
legend('Original Data', 'Fitted Curve');
xlabel('x values');
ylabel('y values');
title('Curve Fitting');
grid on;
