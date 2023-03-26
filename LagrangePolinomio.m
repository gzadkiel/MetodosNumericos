% Inputs:
%  - X: Vector of x-coordinates of data points
%  - Y: Vector of y-coordinates of data points
%  - compare_rounded_polynomial: boolean indicating whether to compare with rounded polynomial or not. If
%    the variable is false or it is not provided only the non-rounded polynomial is calculated
% 
% Outputs:
%  - polynomial: Lagrange interpolation polynomial evaluated at k
%
% Example usage with manual data input:
% X = [1 2 3 4];
% Y = [1 4 9 16];
% compare_rounded_polynomial = true;
% polynomial_lagrange(X, Y, compare_rounded_polynomial);
%
% Example usage with manual data input:
% X = [1 2 3 4];
% Y = [1 4 9 16];
% polynomial_lagrange(X, Y);

function [polynomial, rounded_polynomial] = LagrangePolinomio(X, Y, compare_rounded_polynomial)

  syms x; 
  pol_grange = 0;
  pol_grange_rounded = 0;
  
  for i=1:length(Y) 
    lag = 1; 
    % Compute the Lagrange basis polynomial for this point
    for j=1:length(X) 
      if j ~= i 
        lag = lag.*(x-X(j))./(X(i)-X(j));
      end
    end
    % Add the contribution of this point to the polynomial
    pol_grange = pol_grange + vpa(Y(i).*lag);
  end
  
  simplified_pol = simplify(pol_grange);
  disp('Polynomial: ')
  disp(simplified_pol)
  
  figure('Name', 'Polynomial')
  ezplot(simplified_pol, [min(X), max(X)]) 
  
  if compare_rounded_polynomial
    rounded_pol = vpa(simplify(pol_grange), 5);
    disp('Rounded polynomial: ')
    disp(rounded_pol)
  
    figure('Name', 'Rounded Polynomial')
    ezplot(rounded_pol, [min(X), max(X)]) 
  end
  
  polynomial = simplified_pol;
  rounded_polynomial = rounded_pol; 

end