% This function reads in a matrix A, and calculates the convergence
% matrices for the Jacobi and Gauss-Seidel iterative methods.
%
% Inputs:
%  - A: n x n matrix containing the coefficients of a linear system of equations
%
% Outputs:
%  - rJac: Spectral radius of the iteration matrix for the Jacobi method
%  - rGS: Spectral radius of the iteration matrix for the Gauss-Seidel method
%  - nJac: Norm of the iteration matrix for the Jacobi method
%  - nGS: Norm of the iteration matrix for the Gauss-Seidel method
%
% Example:
% A = [4 -1 0; -1 4 -1; 0 -1 4];
% [rJac, rGS, nJac, nGS] = ConvergenciaChecker(A);

function [BJac, BGS, rJac, rGS] = ConvergenciaChecker(A)

    L       = tril(A,-1);
    U       = triu(A,1); 
    BJac    = -inv(D)*(L+U);
    BGS     = inv(D+L)*(-U); 
    rJac    = max(abs(eig(BJac)));
    rGS     = max(abs(eig(BGS)));
    D       = diag(diag(A));
    
    % Display results
    res1 = ['Radio espectral de Jacobi: ',num2str(rJac)]; disp(res1)
    res11 = ['Norma de B (Jacobi): ', num2str(norm(BJac,1))]; disp(res11)
    res2 = ['Radio espectral de GS: ',num2str(rGS)]; disp(res2) 
    res22 = ['Norma de B (GS): ', num2str(norm(BGS,1))]; disp(res22)
    
end
    