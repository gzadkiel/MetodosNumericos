% Performs Newton's divided differences interpolation for a given set of data points.
%
% Inputs:
%  - xv: a vector with the x-coordinates of the data points
%  - yv: a vector with the y-coordinates of the data points
%
% Outputs:
%  - pol_p: the polynomial in Newton's form, expressed in terms of x
%  - pol_r: the polynomial in Newton's form, expressed in terms of x
%  - coef_p: the vector of coefficients of the polynomial in progressive form
%  - coef_r: the vector of coefficients of the polynomial in regressive form

function [pol_p, pol_r, coef_p, coef_r] = newton_interpolation(xv, yv)
    % This function takes as input two vectors xv and yv, which represent the
    % x and y coordinates of the points to be interpolated using the Newton
    % interpolation method. The function returns the progressive and regressive
    % polynomials, and their corresponding coefficient vectors.
    
    % Length of the input vectors
    n = length(xv);
    
    % Create the difference matrix
    mtx = zeros(n,n);
    mtx(:,1) = yv';
    for i=2:n
        m = n-i+1;
        for j=1:m
            ax1 = mtx(j+1,i-1)-mtx(j,i-1);
            ax2 = xv(i+j-1)-xv(j);
            mtx(j,i) = ax1/ax2;
        end
    end
    
    % Display the difference matrix
    fprintf('Difference matrix:\n');
    vpa(mtx,4)
    
    % Create the progressive polynomial
    syms x
    pol_p = 0;
    m = 1;
    for i=1:n
        aux = 1;
        for k=2:m
            aux = aux*(x-xv(k-1));
        end
        m = m + 1;
        pol_p = pol_p + mtx(1,i)*aux;
    end
    
    % Display the progressive polynomial
    fprintf('Progressive polynomial:\n');
    vpa(pol_p,4)
    
    % Simplify the progressive polynomial
    pol_p = simplify(pol_p);
    
    % Display the simplified progressive polynomial
    fprintf('Simplified progressive polynomial:\n');
    disp(pol_p);
    
    % Extract the coefficients of the progressive polynomial
    [num_p,den_p] = numden(pol_p);
    coef_p = sym2poly(num_p)/sym2poly(den_p);
    
    % Display the coefficient vector for the progressive polynomial
    fprintf('Coefficient vector for the progressive polynomial:\n');
    disp(coef_p);
    
    % Create the regressive polynomial
    pol_r = 0;
    m = n;
    for i=1:n
        % The auxiliary variable is used to extract the roots
        aux = 1;
        % This for loop starts when n-1 equals m, i.e., in the second iteration
        for k=n-1:-1:m
            aux = aux*(x-xv(k+1));
        end
        pol_r = pol_r + mtx(m,i)*aux;
        m = m-1;
    end
    
    % Display the regressive polynomial
    fprintf('Regressive polynomial:\n');
    vpa(pol_r,4)
    
    % Simplify the regressive polynomial
    pol_r = simplify(pol_r);
    
    % Display the simplified regressive polynomial
    fprintf('Simplified regressive polynomial:\n');
    disp(pol_r);
    
    % Extract the coefficients of the regressive polynomial
    [num_r,den_r] = numden(pol_r);
    coef_r = sym2poly(num_r)/sym2poly(den_r);
    
    % Display the coefficient vector for the regressive polynomial
    fprintf('Coefficient vector for the regressive polynomial:\n');
    disp(coef_r);
    
    % Plot the regressive polynomial and the data points
    xplot = linspace(min(xv),max(xv),100);
    
    figure;
    plot(xplot,polyval(coef_r,xplot));
    hold on
    plot(xv,yv,'o');
    hold off
    
end    