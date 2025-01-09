clc;    % Clear the command window
clear;  % Clear variables
close all; % Close any open figures

% Define the function
f = @(x) cos(x) - x * exp(x);

% Input the initial guesses, allowed error, and max iterations
x0 = input('Enter the first guess (x0): ');
x1 = input('Enter the second guess (x1): ');
allowed_error = input('Enter the allowed error: ');
max_iterations = input('Enter the maximum number of iterations: ');

% Check if the root lies in the interval
if f(x0) * f(x1) > 0
    disp('The function has the same sign at x0 and x1. Root may not exist in this interval.');
    return;
end

% Initialize variables
itr = 0;
x2 = x0; % Start with x0 as the initial value
fprintf('Iteration %3d: x = %7.5f\n', itr, x2);

% Start the Regula Falsi Method
while itr < max_iterations
    itr = itr + 1; % Increment the iteration counter
    
    % Calculate the new approximation using Regula Falsi formula
    x2 = x0 - (f(x0) * (x1 - x0)) / (f(x1) - f(x0));
    fprintf('Iteration %3d: x = %7.5f\n', itr, x2);
    
    % Check if the root lies in the left or right interval
    if f(x0) * f(x2) < 0
        x1 = x2;
    else
        x0 = x2;
    end
    
    % Check for convergence
    if abs(f(x2)) < allowed_error
        fprintf('Root found after %d iterations: x = %7.5f\n', itr, x2);
        return;
    end
end

% If the method does not converge
disp('Solution did not converge within the maximum number of iterations.');
