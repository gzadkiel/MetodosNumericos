% Uses the Newton-Raphson method to solve a system of three equations with three variables.
% 
% Inputs:
%  - f, g, h: Symbolic expressions for the system of equations.
%  - x0: Initial guess for the solution, given as a 3x1 column vector.
%  - cota1, cota2: Tolerance values for the maximum error in the variables and 
%   in the system of equations, respectively.
%  - n: Maximum number of iterations to perform.
%
% Outputs:
%  - sol: The solution found by the method, given as a 3x1 column vector.
%  - iters: The number of iterations performed by the method.
%  - err1, err2: The errors in the variables and in the system of equations, 
%   respectively, at the final iteration.

function [sol, iters, err1, err2] = newton_raphson_3eqs(f, g, h, x0, cota1, cota2, n)

  % Load the symbolic package
  pkg load symbolic
  % Define symbolic variables
  syms x y t
  % Define the system of equations and its Jacobian
  sist = [f; g; h];
  J = jacobian(sist, [x y t]);
  % Initialize error variables and iteration counter
  err1 = 999;
  err2 = 999;
  iters = 0;
  % Perform the iterations
  while (err1 > cota1) && (err2 > cota2) && (iters < n)
      % Compute the next approximation using the Newton-Raphson formula
      xsol = subs(x0 - inv(J)*sist, [x y t], [x0(1,1) x0(2,1) x0(3,1)]);
      pasomedio = double(xsol);
      
      % Compute the errors in the variables and in the system of equations
      err1 = norm(double(xsol - x0), 1);
      err2 = norm(double(subs(sist, [x y t], [x0(1,1) x0(2,1) x0(3,1)])));
      
      % Update the iteration counter and the current approximation
      iters = iters + 1;
      x0 = pasomedio;
  end
  % Return the final solution and error values
  sol = x0;
  err1 = err1;
  err2 = err2;

end  