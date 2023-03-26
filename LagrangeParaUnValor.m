% Inputs:
%  - X: 1D array of n X-values
%  - Y: 1D array of n Y-values corresponding to the X-values
%  - k: Value to evaluate the Langrage polynomial at
%
% Outputs:
%  - pol: Value of the Langrage polynomial evaluated at k
%  - eles: 1D array of intermediate Langrage polynomial values at each iteration
%
% Example usage for both manual data input of text file data input:
%
% Manually input data:
% X = [1 2 4 7];
% Y = [3 5 1 4];
% k = 3;
% Calculate Langrage interpolation polynomial
% [pol, eles] = LagrangeParaUnValor(X, Y, k);
%
% Read data from text file:
% data = load('data.txt');
% X = data(:,1);
% Y = data(:,2);
% k = 3;
% Calculate Langrage interpolation polynomial
% [pol, eles] = LagrangeParaUnValor(X, Y, k);

function [pol, eles] = LagrangeParaUnValor(X, Y, k)

  % Initialize variables
  pol  = 0;  
  eles = zeros(1,length(Y));
  
  % Iterate through each Y-value
  for i=1:length(Y)
    prod = 1;
    
    % Iterate through each X-value
    for j=1:length(X)
      % Calculate the product of the terms in the Langrage polynomial
      if X(i) ~= X(j)
        prod = prod*(k-X(j))/(X(i)-X(j));
      end
    end
    
    % Calculate the Langrage polynomial value for the current Y-value
    pol = pol + prod*Y(i);
    eles(1,i) = pol; 
  end
  
  % Display the results
  res = ['The function evaluated at ', num2str(k), ' is approximately: ', num2str(pol)];
  disp(res)
  disp(eles)
  
end  