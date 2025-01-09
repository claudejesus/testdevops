clc;    % Clear command window
clear;  % Clear variables
close all; % Close all figures

% Input size of the system
N = input('Enter the number of variables: ');

% Input augmented matrix
disp('Enter the elements of the augmented matrix row-wise:');
A = zeros(N, N+1); % Augmented matrix
for i = 1:N
    for j = 1:N+1
        A(i, j) = input(sprintf('A(%d,%d): ', i, j));
    end
end

% Forward elimination (Upper triangular matrix)
for j = 1:N-1
    for i = j+1:N
        factor = A(i, j) / A(j, j);
        for k = 1:N+1
            A(i, k) = A(i, k) - factor * A(j, k);
        end
    end
end

% Display the upper triangular matrix
disp('The upper triangular matrix is:');
disp(A);

% Back substitution to find solution
x = zeros(N, 1); % Solution vector
for i = N:-1:1
    sum = 0;
    for j = i+1:N
        sum = sum + A(i, j) * x(j);
    end
    x(i) = (A(i, N+1) - sum) / A(i, i);
end

% Display the solution
disp('The solution is:');
for i = 1:N
    fprintf('x(%d) = %.4f\n', i, x(i));
end
