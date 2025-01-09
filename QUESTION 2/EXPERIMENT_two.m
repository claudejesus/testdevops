clc;    % Clear the command window
clear;  % Clear variables
close all; % Close any open figures

% Define the function
f = @(x) x^3 - 4*x - 9;

% Input the interval, error tolerance, and max iterations
a = input('Enter the lower bound (a): ');
b = input('Enter the upper bound (b): ');
allowed_error = input('Enter the allowed error: ');
max_iterations = input('Enter the maximum number of iterations: ');

% Check if root lies within the interval
if f(a) * f(b) > 0
    disp('The function has the same sign at a and b. Root may not exist in this interval.');
    return;
end

% Initialize variables
itr = 0;
x = (a + b) / 2; % Initial midpoint
fprintf('Iteration %3d: x = %7.5f\n', itr, x);

% Start the Bisection Method
while itr < max_iterations
    itr = itr + 1; % Increment iteration count
    x_old = x;     % Store the previous midpoint
    
    % Check which subinterval contains the root
    if f(a) * f(x) < 0
        b = x;
    else
        a = x;
    end
    
    % Calculate new midpoint
    x = (a + b) / 2;
    fprintf('Iteration %3d: x = %7.5f\n', itr, x);
    
    % Check for convergence
    if abs(x - x_old) < allowed_error
        fprintf('Root found after %d iterations: x = %7.5f\n', itr, x);
        return;
    end
end

% If the method does not converge
disp('Solution did not converge within the maximum number of iterations.');
