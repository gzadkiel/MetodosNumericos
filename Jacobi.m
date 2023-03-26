% This function solves the system A*x = b using Jacobi method
%
% Inputs:
%  - A: Matrix of coefficients
%  - b: Matrix of independent terms
%  - n: Number of iterations (if "use_tolerance" is false)
%  - tol: Tolerance of error (if "use_tolerance" is true). Can be either tolerance of
%    the absolute/relative error or the tolerance of the residual. 
%    Comment/uncomment inside of the while loop depending on what you want to use as a reference
%  - use_tolerance: Boolean variable to select whether to use tolerance or iterations
%
% Outputs:
%  - x0: Solution vector
%  - resid: Residual vector
%  - num_iters: Number of iterations performed
%
% Usage example:
% A = [4 -1 0; 1 4 -1; 0 -1 4];
% b = [12; 5; 6];
% n_iter = 50;
% use_while_loop = true;
% [x0, resid, num_iters] = Jacobi(A, b, n, tol, use_tolerance);

function [x0, resid, num_iters] = Jacobi(A, b, n, tol, use_tolerance)
  % Initializations
  D   = diag(diag(A)); 
  L   = tril(A,-1); 
  U   = triu(A,1); 
  x0  = zeros(size(b)); 
  B   = -inv(D)*(L+U);
  c   = inv(D)*b;
  num_iters = 0;
  
  if max(abs(eig(B))) < 1 
      if use_tolerance
          er = 999;
          while (er > tol)
              x = B*x0 + c;
              er = norm((A*x-b),1);             % Residual norm
              %er = norm((x-x0),1);             % Absolute error
              %er = norm((x-x0),1)/norm(x0,1);  % Relative error 
              x0 = x;
              num_iters = num_iters + 1;
          end
      else
          for j = 1:n
              x = B*x0 + c;
              x0 = x;
              num_iters = num_iters + 1;
          end
      end
      
      resid = A*x0 - b;
      disp('Solution:')
      disp(x0)
      disp('Residual:')
      disp(resid)
      res1 = ['Number of iterations: ',num2str(num_iters)]; disp(res1) 
  else
      disp('Error: matrix A does not converge.')
      x0 = [];
      resid = [];
  end

end