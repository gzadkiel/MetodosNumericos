% Calculates the integral of the given function using
% the Romberg integration method.
%
% Inputs:
%   - X: Vector containing the x-values of the function samples
%   - Y: Vector containing the y-values of the function samples
%   - a: Lower limit of the integration interval
%   - b: Upper limit of the integration interval
%   - n: Number of points used for the integration
%
% Output:
%   - R: Romberg matrix containing the integrated values
%
% Example usage:
%   >> x = linspace(0,1,5);
%   >> y = exp(x);
%   >> R = RombergDefinitivo(x, y, 0, 1, 5);

function R = RombergDefinitivo(X, Y, a, b, n)
  
  k = log2(n-1) + 1;
  
  % Calculate the step sizes for each level
  for i = 1:k
      h(i) = (b-a)/2^(i-1);
  end
  
  % Find the indices in the Y vector for the limits of integration
  indA = find(X == a, 1);
  indB = find(X == b, 1);
  
  % Calculate R(1,1), the first element of the matrix
  R(1,1) = (h(1)/2) * (Y(indA) + Y(indB));
  
  % Calculate the first column of the matrix
  for i = 2:k
      sumint = 0;
      for j = 1:2^(i-2)
          value = a + ((2*j-1)/2)*h(i-1);
          % Find the index in the X vector for the current value
          indval = find(abs(X-value) <= (1*10^-4), 1);
          sumint = sumint + Y(indval);
      end
      aux = R(i-1,1) + h(i-1)*sumint;
      R(i,1) = 0.5*aux;
  end
  
  % Complete the matrix using Richardson extrapolation
  for j = 2:k
      for i = j:k
          aux1 = 4^(j-1)*R(i,j-1) - R(i-1,j-1);
          aux2 = 4^(j-1)-1;
          R(i,j) = aux1/aux2;
      end
  end
  
  % Display the Romberg matrix
  disp('Romberg Matrix: ');
  disp(R);

end