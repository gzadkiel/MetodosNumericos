% Inputs:
%   - F: Function handle for F(y,t)
%   - h: Step size for the method
%   - t0: Initial value of t
%   - y0: Initial value of y
%   - tf: Final value of t to be evaluated
%
% Outputs:
%   - tv: Vector of t values at each step
%   - yv: Vector of y values at each step
%
% Example usage:
% F = @(y,t) y - t^2 + 1;
% h = 0.1;
% t0 = 0;
% y0 = 0.5;
% tf = 2;
% [tv, yv] = EulerSimple(F, h, t0, y0, tf);

function [tv, yv] = EulerSimple(F, h, t0, y0, tf)  
  % Define the array of time values from t0 to tf with step size h
  tv = t0:h:tf;
  
  % Initialize the solution array with the initial condition
  yv(1) = y0;
  
  % Implement the non-improved Euler method to compute the solution at each
  % time step
  for i = 1:length(tv)-1  
      yv(i+1) = yv(i) + h * F(yv(i), tv(i));
  end
  
  % Display the computed values of time and the solution at those times
  disp('Valores de t: ')
  disp(tv)
  disp('Valores de y: ')
  disp(yv)
  
  % Plot results
  plot(tv, yv);
  xlabel('t');
  ylabel('y');
  title('Solution of y'' = y - t^2 + 1 using Euler method');

end  