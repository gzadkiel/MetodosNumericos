% [SOL, RESIDUO, ITERS] = GAUSS_SEIDEL(A, B, N, USE_TOLERANCE, TOL) uses the Gauss-Seidel 
% method to solve the linear system A*x = b with an initial guess x0 = [0,0,...,0].
%
% Inputs:
%  - A: Coefficient matrix
%  - B: Constant vector
%  - N: either the maximum number of iterations (when  is false), or the maximum number 
%    of iterations to perform until the solution's error falls below TOL (when USE_TOLERANCE is true).
%  - USE_TOLERANCE: Boolean variable to select if a tolerance is used or not
%  - TOL: If the previus input is true, then this is the tolerance used (can be either tolerance of
%    the absolute/relative error or the tolerance of the residual). Comment/uncomment inside of the 
%    while loop depending on what you want to use as a reference
% 
% Outputs:
%  - SOL: Solution of the system
%  - RESIDUO: Residual of the solution
%  - ITERS: Number of iterations performed 
%
% Example usage: 
% A = [2 1; 5 7];
% b = [11; 13];
% n = 100;
% use_tolerance = true;
% tol = 1e-8;
% [sol, residuo, iters] = gauss_seidel(A, b, n, use_tolerance, tol);


function [sol, residuo, iters] = gauss_seidel(A, b, n, use_tolerance, tol)
    
  % Extract diagonal, lower and upper triangular matrices
  D = diag(diag(A));
  L = tril(A,-1);
  U = triu(A,1);
  % Compute B and c for the iteration
  B = inv(D+L)*(-U);
  c = inv(D+L)*b;
  % Check for convergence
  if max(abs(eig(B))) < 1
    % Initialize the error and iteration counter
    er = 999;
    cont = 0;
    % Initialize the initial guess
    x0 = zeros(size(b));
    % Perform the iterations
    if use_tolerance
      while (er > tol) && (cont < n)
        x = B*x0 + c;
        %er = norm((x-x0),1);             % Absolute error
        er = norm((x-x0),1)/norm(x0,1);   % Relative error
        %er = norm((A*x-b),1);            % Residual error
        x0 = x;
        cont = cont+1;
      end
    else
      for j=1:n
        x = B*x0 + c;
        x0 = x;
        cont = j;
      end
    end
    % Compute the solution and residual
    sol = x0;
    residuo = A*x0-b;
    iters = cont;
  else
    disp('The method does not converge.');
    sol = NaN;
    residuo = NaN;
    iters = NaN;
  end

end