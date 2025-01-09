clc;    % Clear command window
clear;  % Clear variables
close all; % Close all figures

% Define the function to integrate
y = @(x) 1./(1 + x.^2);

% Input the limits and number of subintervals
x0 = input('Enter the lower limit (x0): ');
xn = input('Enter the upper limit (xn): ');
n = input('Enter the number of subintervals (n): ');

% Calculate step size
h = (xn - x0) / n;

% Apply the Trapezoidal Rule
s = y(x0) + y(xn); % Add first and last terms
for i = 1:n-1
    xi = x0 + i * h; % Calculate intermediate points
    s = s + 2 * y(xi); % Add twice the intermediate terms
end

% Compute the integral
integral = (h / 2) * s;

% Display the result
fprintf('The value of the integral is: %.4f\n', integral);
