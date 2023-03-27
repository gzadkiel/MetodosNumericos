% Solves a system of equations using the Newton-Raphson method
%
% Inputs:
%  - f: A string or symbolic expression representing the first equation of the system.
%  - g: A string or symbolic expression representing the second equation of the system.
%  - x0: A 2x1 matrix representing the initial guess for the values of x and y.
%  - n: An integer representing the maximum number of iterations to be performed.
%  - cota: Tolerance for error
%
% Outputs: 
%
%  - sol: A 2x1 matrix representing the solution of the system of equations.
%  - iter: An integer representing the number of iterations performed.
%  - err: Error
%
% Example usage:
% syms x y
% f = x^2 + y^2 - 1;
% g = x + y - 2;
% x0 = [0.5; 1.5];
% n = 10;
% cota = 1e-6;
% [sol, iter, err] = NRSimbolicoSist(f, g, x0, n, cota)

function [sol, iter, err] = NRSimbolicoSist(f, g, x0, n, cota)

  syms x y
  J = jacobian([f, g], [x, y]);
  sist = [f; g];
  er = 999;
  iter = 0;
  while (iter < n) && (er > cota)
      iter = iter + 1;
      xsol = subs(x0 - inv(J)*sist, [x; y], [x0(1); x0(2)]);
      pasomedio = double(xsol);
      er = norm(xsol - x0, 1);
      x0 = pasomedio;
  end
  sol = x0;
  err = er;
  
end