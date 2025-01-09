clc;        % Clear the command window
clear;      % Clear variables
close all;  % Close all figures

% Input values
n = input('Enter the number of data points (n): ');

% Initialize arrays
x = zeros(n, 1); 
y = zeros(n, 1);

disp('Enter the data points as [x, y]:');
for i = 1:n
    data = input(sprintf('Point %d [x y]: ', i));
    x(i) = data(1);
    y(i) = data(2);
end

% Input the value of x for which y is to be interpolated
x_target = input('Enter the value of x for which y is wanted: ');

% Step size (h)
h = x(2) - x(1);

% Create the difference table
diff_table = zeros(n, n);
diff_table(:, 1) = y;

% Calculate forward differences
for j = 2:n
    for i = 1:(n-j+1)
        diff_table(i, j) = diff_table(i+1, j-1) - diff_table(i, j-1);
    end
end

% Display the difference table
disp('Difference Table:');
disp(diff_table);

% Find the interval containing x_target
i = 1;
while i <= n && x(i) <= x_target
    i = i + 1;
end
i = i - 1;

% Calculate p
p = (x_target - x(i)) / h;
%adsfghj
% Interpolation using Newton's forward formula
y_target = y(i);
nr = 1; % Numerator for p term
dr = 1; % Denominator for factorial

for k = 1:n-1
    nr = nr * (p - (k-1));
    dr = dr * k;
    y_target = y_target + (nr / dr) * diff_table(i, k+1);
end

% Display the result
fprintf('When x = %.2f, y = %.4f\n', x_target, y_target);
