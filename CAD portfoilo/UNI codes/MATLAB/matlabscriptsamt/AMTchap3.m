clc; clear; close all;

% Asking for user input as space-separated values
x_str = input('Enter x values (space-separated, as a string): ', 's');
y_str = input('Enter y values (space-separated, as a string): ', 's');

% Convert the input strings to numerical arrays
x = str2num(x_str); %#ok<ST2NM> 
y = str2num(y_str); %#ok<ST2NM> 

n = length(x);
h = x(2) - x(1); % Step size (assuming equally spaced data)

% Forward Difference Table
forward_diff = zeros(n, n);
forward_diff(:,1) = y';

for j = 2:n
    for i = 1:(n-j+1)
        forward_diff(i,j) = forward_diff(i+1,j-1) - forward_diff(i,j-1);
    end
end

% Backward Difference Table
backward_diff = zeros(n, n);
backward_diff(:,1) = y';

for j = 2:n
    for i = n:-1:j
        backward_diff(i,j) = backward_diff(i,j-1) - backward_diff(i-1,j-1);
    end
end

% Displaying Forward Difference Table
fprintf('\nForward Difference Table:\n');
disp(forward_diff);

% Displaying Backward Difference Table
fprintf('\nBackward Difference Table:\n');
disp(backward_diff);

% Asking for interpolation point
x_interp = input('Enter the value of x for interpolation: ');

% Newton Forward Interpolation
p = (x_interp - x(1)) / h;
forward_interp = y(1);
fact = 1;
for j = 2:n
    fact = fact * (j-1);
    term = (p * prod(p-(1:j-2))) / fact * forward_diff(1,j);
    forward_interp = forward_interp + term;
end

% Newton Backward Interpolation
p = (x_interp - x(n)) / h;
backward_interp = y(n);
fact = 1;
for j = 2:n
    fact = fact * (j-1);
    term = (p * prod(p+(1:j-2))) / fact * backward_diff(n,j);
    backward_interp = backward_interp + term;
end

% Display results
fprintf('\nNewton Forward Interpolation Result: f(%.4f) = %.4f\n', x_interp, forward_interp);
fprintf('\nNewton Backward Interpolation Result: f(%.4f) = %.4f\n', x_interp, backward_interp);
