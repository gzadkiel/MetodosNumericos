% Inputs:
%  - X: Vector with the x-values of the function
%  - Y: Vector with the y-values of the function
%  - a: Lower limit of integration
%  - b: Upper limit of integration
%  - n: Number of intervals
% 
% Output:
%  - intgral: The value of the integral of the function between a and b
%
% Example usage: 
% X = [0 1 2 3 4 5 6];
% Y = [0 1 4 9 16 25 36];
% intgral = Simpson13(X,Y,0,6,3)

function intgral = Simpson13(X,Y,a,b,n)
  
  % Calculate the width of each subinterval
  h = (b-a)/n;
  
  % Find the indices in the X vector that correspond to the lower and upper
  % limits of integration
  indA = find(abs(X-a) < 0.0001);
  indB = find(abs(X-b) < 0.0001);
  
  % Compute the sum of the terms in the formula that are multiplied by 4
  sum1 = 0;
  for i = 1:1+(n-2)/2 
      ind = 2*(i-1)+1+1;
      sum1 = sum1 + Y(ind);
  end
  sum1 = 4*sum1;
  
  % Compute the sum of the terms in the formula that are multiplied by 2
  sum2 = 0;
  for i = 2:1+(n-2)/2
      ind = 2*(i-1)+1;
      sum2 = sum2 + Y(ind); 
  end
  sum2 = 2*sum2;
  
  % Compute the integral using the Simpson 1/3 formula
  integ = Y(indA) + Y(indB) + sum1 + sum2;
  intgral = (h/3) * integ;
  
end