% Inputs:
%  - F: Function handle of the function to be evaluated
%  - a, b: Interval limits
%  - tolx, toly: Tolerances for x and y, respectively
%
% Outputs:
%  - x: The root of the function within the interval (a,b)
%  - niter: Number of iterations needed to converge to the root
%  - ex: Error in x
%  - ey: Error in y
%
% Example usage:
% f = @(x) x^3 - 2*x - 5;
% a = 1;
% b = 3;
% tolx = 1e-6;
% toly = 1e-6;
% [x, niter, ex, ey] = Biseccion(f, a, b, tolx, toly);

function [x, niter, ex, ey] = Biseccion(F, a, b, tolx, toly)

    % Initialize variables for loop
    xant    = 0;
    ey = ex = 999;
    i       = 0;

    % Iterate until both tolerances are met
    while (ex > tolx) && (ey > toly)
        i   = i + 1;               % Increment iteration counter
        xs  = (a + b) / 2;         % Calculate interval midpoint
        ya  = F(a);                % Evaluate function at interval endpoint a
        yb  = F(b);                % Evaluate function at interval endpoint b
        fxs = F(xs);               % Evaluate function at interval midpoint
        ex  = abs(xs - xant);      % Calculate error in x
        ey  = abs(fxs);            % Calculate error in y
        if fxs*ya < 0              % Check if root is in left half of interval
            b = xs;
        else                       % Otherwise, root is in right half of interval
            a = xs; 
        end
        xant = xs;                 % Update previous x value
    end

    % Output results
    x       = xant;
    niter   = i;
    ex      = ex;
    ey      = ey;

    % Plot results 
    fprintf('The root is: %f\n', x);
    fprintf('Number of iterations: %d\n', niter);
    fprintf('Error in x: %f\n', ex);
    fprintf('Error in y: %f\n', ey);

end