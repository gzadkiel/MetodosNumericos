% Inputs:
% F: Function handle @(y,t) for F(y,t) in y' = F(y,t)
% h: Step size
% t0: Initial value for the independent variable t
% y0: Initial value for the dependent variable y(t0)
% tf: Value to approximate y(tf)
%
% Outputs:
% tv: Vector of t values used to approximate the solution
% yv: Vector of y values obtained from the approximation
%
% Example:
% Define the function F(y,t) in y' = F(y,t)
% F = @(y,t) -2*y + 4*sin(t);
%
% Define the initial conditions
% t0 = 0;
% y0 = 0;
%
% Define the step size and the value to approximate
% h = 0.1;
% tf = 5;
%
% Call the function to obtain the approximation
% [tv, yv] = improved_euler(F, h, t0, y0, tf);

function [tv, yv] = EulerMejorado(F, h, t0, y0, tf)

% Initialize time and y vectors
tv = t0:h:tf;
yv(1) = y0; 

for i=1:length(tv)-1  
  % Compute slopes at current point and at point predicted by forward Euler method
  tr1 = F(yv(i),tv(i));
  tr2 = F(yv(i)+h*(F(yv(i),tv(i))),tv(i+1));  
  % Compute next y value using Improved Euler method
  yv(i+1) = yv(i) + (h/2)*(tr1+tr2);
end

% Plot the results
plot(tv, yv, '-o')
xlabel('t')
ylabel('y')
title('Aproximación con Euler Mejorado')

end
