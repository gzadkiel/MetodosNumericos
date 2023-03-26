% Inputs:
%  - f: The function to find the root of
%  - a: The lower bound of the interval
%  - b: The upper bound of the interval
%  - tolx: The tolerance in x for the approximation
%
% Outputs:
%  - root: The approximated root of the function
%  - iterations: The number of iterations it took to reach the root
%  - error_x: The error in x between the approximated root and the true value
%
% Example usage:
% f = @(x) x^3 - 2*x - 5;
% a = 1;
% b = 3;
% toly = 1e-6;
% [x, niter, ex] = BiseccionY(f, a, b, tolx);

function [root, iterations, error_x] = BiseccionY(f, a, b, tolx)
 
  % Initialize the variables
  ex  = 999;
  i   = 0;
  
  % Loop until the error in y is less than the tolerance
  while (ex > tolx) 
      i = i + 1; 
      xs = (a + b) / 2; 
      ya = F(a);
      yb = F(b); 
      fxs = F(xs);
      ex = abs(fxs);
      
      % Check the sign of f(xs) to determine which sub-interval to choose
      if fxs * ya < 0
          b = xs; 
      else
          a = xs; 
      end
  end
  
  % Set the output values
  root = xs;
  iterations = i;
  error_x = ex;

  % Plot results 
  fprintf('The root is: %f\n', root);
  fprintf('Number of iterations: %d\n', iterations);
  fprintf('Error in x: %f\n', erro_x);

end