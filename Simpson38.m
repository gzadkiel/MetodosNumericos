% Inputs:
%  - Y: Vector of function values
%  - X: Vector of corresponding x values
%  - a: Lower limit of integration
%  - b: Upper limit of integration
%  - n: Number of subintervals
%
% Output:
%  - intgral: Numerical approximation of the integral using Simpson's 3/8 rule

function intgral = Simpson38(Y, X, a, b, n)
  
  if mod(n,3) ~= 0 
      disp('Error: The number of subintervals is not a multiple of 3')
      intgral = NaN;
      return
  end
  
  m = n/3;
  if m < 3
      disp('Error: The number of subintervals is too small')
      intgral = NaN;
      return
  end
  
  for i=1:length(X)
      if a == X(i)
          indA = i;
      end
  end
  
  for i=1:length(X)
      if b == X(i)
          indB = i;
      end
  end
  
  sum1 = sum2 = sum3 = 0;
  
  for i=1:m
      ind = 3*(i-1)+1+1;
      sum1 = sum1 + Y(ind);  
  end 
  sum1F = 3*sum1;
  
  for i=1:m
      ind = 3*(i-1)+2+1;
      sum2 = sum2 + Y(ind); 
  end 
  sum2F = 3*sum2;
  
  for i=2:m
      ind = 3*(i-1)+1;
      sum3 = sum3 + Y(ind);
  end 
  sum3F = 2*sum3;
  
  sumT = sum1F+sum2F+sum3F;
  integ = Y(indA)+Y(indB)+sumT; 
  intgral = (3*h/8)*integ;
  
end