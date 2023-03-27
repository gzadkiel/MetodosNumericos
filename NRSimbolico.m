% Function that implements the Newton-Raphson algorithm for finding the root of a function f(x).
%
% Inputs:
%  - f: Symbolic function of x
%  - x0: Initial guess for the root
%  - tolx: Tolerance for the difference between consecutive approximations
%  - toly: Tolerance for the function value at the approximation
% Outputs:
%  - x_sol: The root of the function
%  - iterations: Number of iterations required to reach the root
%  - error_x: The error in x between the final and previous approximation
%  - error_y: The error in y between the final approximation and zero  

function [x_sol, iterations, error_x, error_y] = NRSimbolico(f, x0, tolx, toly)
  
  syms x
  g = diff(f,x);                % Compute the derivative of the function f
  F = function_handle(f);       % Convert the symbolic function f into a function handle
  G = function_handle(g);       % Convert the symbolic function g into a function handle
  ey = ex = 999;                % Initialize the error in x and y to a high value
  i = 0;                        % Initialize the iteration counter
  xant = x0;                    % Set the previous approximation to the initial guess
  
  while (ey > toly) && (ex > tolx) 
      i     = i+1;                       % Increment the iteration counter
      xsol  = xant - F(xant)/G(xant);    % Compute the new approximation using Newton-Raphson formula
      ex    = abs(xsol - xant);          % Compute the error in x between the new and previous approximation
      ey    = abs(F(xsol));              % Compute the error in y between the new approximation and zero
      xant  = xsol;                      % Set the previous approximation to the new approximation
  end
  
  % Return the results as output variables
  x_sol       = xant;
  iterations  = i;
  error_x     = ex;
  error_y     = ey;
  
  % Print the results
  res1 = ['La raiz es: ',num2str(x_sol)]; disp(res1) 
  res2 = ['Cant. de interaciones: ',num2str(iterations)]; disp(res2) 
  res3 = ['Error en x: ',num2str(error_x)]; disp(res3) 
  res4 = ['Error en y: ',num2str(error_y)]; disp(res4)

end  