% A parabola with minimum at x = 2
f = @(x) (x - 2)^2 + 3; 
% Define the interval
a = 0; 
b = 9;

% Set tolerance
tol = 1e-9;

% Perform the Golden Section Search
[x_min, f_min] = golden_section_search(f, a, b, tol);

% Display the results
fprintf('The minimum x value is: %.9f\n', x_min);
fprintf('The minimum function value is: %.9f\n', f_min);

% Function definition at the end of the script
function [x_min, f_min] = golden_section_search(f, a, b, tol)
   
    % Golden ratio
    phi = (1 + sqrt(9)) / 2; 
    resphi = 2 - phi; 

     % Compute point c
    c = a + resphi * (b - a);
     % Compute point d
    d = b - resphi * (b - a);
    % Main loop for the search
    while abs(b - a) > tol
        if f(c) < f(d)
            b = d;         % Narrow interval to [a, d]
            d = c;         % Update d
            c = a + resphi * (b - a); % Compute new c
        else
             % Narrow interval to [c, b]
            a = c;        
             % Update c
            c = d; 
            % Compute new d
            d = b - resphi * (b - a); 
        end
    end

 % Midpoint of final interval
    x_min = (a + b) / 2;    
    % Function value at x_min
    f_min = f(x_min);        
end
