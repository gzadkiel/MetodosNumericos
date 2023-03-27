% Finds a root of a function using the Regula Falsi method.
%
% Inputs: 
%  - f: Function to evaluate
%  - a: Lower endpoint of the interval
%  - b: Upper endpoint of the interval
%  - tolx: Tolerance for x error
%  - toly: Tolerance for y error
%
% Ouputs: 
%  - root: Calculated root
%  - iter: Numer of iterations
%  - err_x: Error in x
%  - err_y: Error in y
%
% Example usage:
% [root, iter, err_x, err_y] = RegulaFalsi(@(x) x^3-x-1, 1, 2, 1e-6, 1e-6);

function [root, iter, err_x, err_y] = RegulaFalsi(F, a, b, tolx, toly)
  
  % Initialize the iteration counter and errors
  iter = 0;
  err_x = 999;
  err_y = 999;
  
  % Check if the interval [a,b] satisfies Bolzano's theorem
  if F(a)*F(b) < 0 
      while (err_x > tolx) && (err_y > toly)
          iter = iter + 1;              % Increase the iteration counter
          xant = x0;                    % Save the previous approximation
          ya = F(a);
          yb = F(b);
          xsol = (a*yb-b*ya)/(yb-ya);
          err_x = abs(xsol - xant);     % Calculate the error in x
          err_y = abs(F(xsol));         % Calculate the error in y
          % Update the interval
          if F(xsol)*ya < 0
              b = xsol;
          else
              a = xsol;
          end
      end
      root = xant;    % Save the final approximation
  else
      root = NaN;     % Return NaN if Bolzano's theorem is not satisfied
  end
  
  % Display the results
  disp(['La raiz es: ',num2str(root)]);
  disp(['Cant. de iteraciones: ',num2str(iter)]);
  disp(['Error en x: ',num2str(err_x)]);
  disp(['Error en y: ',num2str(err_y)]);

end  