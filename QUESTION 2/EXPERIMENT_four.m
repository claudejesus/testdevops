clc;    % Clear the command window
clear;  % Clear all variables
close all; % Close all figures

% Define the function and its derivative
f = @(x) x * log10(x) - 1.2;        % Function
df = @(x) log10(x) + 0.43429;       % Derivative of the function

% Input initial guess, allowed error, and maximum iterations
x0 = input('Enter the initial guess (x0): ');
allowed_error = input('Enter the allowed error: ');
max_iterations = input('Enter the maximum number of iterations: ');

% Start the Newton-Raphson Method
for itr = 1:max_iterations
    h = f(x0) / df(x0);             % Calculate the step
    x1 = x0 - h;                    % Update the root approximation
    fprintf('Iteration %3d: x = %9.6f\n', itr, x1);
    
    % Check for convergence
    if abs(h) < allowed_error
        fprintf('After %3d iterations, root = %8.6f\n', itr, x1);
        return;
    end
    
    x0 = x1;                        % Update x0 for the next iteration
end

% If the method does not converge
disp('Solution did not converge: maximum iterations reached.');
