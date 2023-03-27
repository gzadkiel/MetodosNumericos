% Fixed-point algorithm for finding the root of a function
% 
% Inputs:
%  - f: Symbolic function to find the root of
%  - a: Lower bound of the interval
%  - b: Upper bound of the interval
%  - x0: Initial value
%  - tolx: Tolerance in x
%  - toly: Tolerance in y
%
% Outputs:
%  - root: Estimated root of the function
%  - iterations: Number of iterations required to reach the root
%  - ex: Error in x at the final iteration
%  - ey: Error in y at the final iteration
%
% Example usage: 
% f = x^2 - 2;
% a = 0;
% b = 2;
% x0 = 1;
% tolx = 1e-6;
% toly = 1e-6;
% [root, iterations, ex, ey] = PtoFijoSimbolico(f, a, b, x0, tolx, toly);

function [root, iterations, ex, ey] = PtoFijoSimbolico(f, a, b, x0, tolx, toly)
  
  syms x
  df = diff(f,x); 
  vec = a:.00001:b;
  F = function_handle(f); 
  G = function_handle(df); 
  max = 0; 
  for i=1:length(vec) 
    if G(vec(i)) > max 
      max = abs(G(vec(i))); 
    end
  end
  ptof = @(x) (x-F(x)/max); 
  dptof = diff(ptof,x); 
  Dptof = function_handle(dptof); 
  for i=1:length(vec) 
    if Dptof(vec(i)) > max 
      disp('No converge.')
    end
  end
  
  xant = x0; 
  ey = ex = 999;
  i = 0;  
  while (ey > toly) && (ex > tolx) 
    i = i+1; 
    xsol = ptof(xant); 
    ex = abs(xsol-xant); 
    ey = abs(F(xsol)); 
    xant = xsol; 
  end
  
  root = xant;
  iterations = i;
  ex = ex;
  ey = ey;

  res1 = ['La raiz es: ',num2str(root)]; disp(res1) 
  res2 = ['Cant. de interaciones: ',num2str(iterations)]; disp(res2) 
  res3 = ['Error en x: ',num2str(ex)]; disp(res3) 
  res4 = ['Error en y: ',num2str(ey)]; disp(res4) 
  
end  