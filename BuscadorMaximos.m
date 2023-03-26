% This function finds the maximum value of the nth derivative of a function
% within a given interval using symbolic math
%
% Inputs:
%  - fun: A symbolic math function
%  - ord: The order of the derivative to be evaluated
%  - a: The lower bound of the interval
%  - b: The upper bound of the interval
%
% Outputs:
%  - max: The maximum value of the nth derivative of the function within the given interval
%
% Example usage:
% fun = x^3 - 6*x^2 + 11*x - 6;
% ord = 1; 
% a = 0;
% b = 4;
% [max_val] = BuscadorMaximos(fun, ord, a, b)

function [max] = BuscadorMaximos(fun, ord, a, b)  
  
  pkg load symbolic         % Load the symbolic math library
  syms x                    % Define symbolic variable x
  xx    = a:0.01:b;         % Define interval
  deriv = diff(fun, ord);   % Compute nth derivative of the function
  max   = 0;                % Initialize max value
  
  % Loop through the interval and find the maximum value of the nth derivative
  for i = 1:length(xx)
      funev = abs(double(subs(deriv, x, xx(i))));
      if funev > max
          max = funev;
      end
  end
  
  % Display the result
  res = ['The maximum value is: ', num2str(max)];
  disp(res)

end  