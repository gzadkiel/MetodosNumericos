% Function to implement the second-order Runge-Kutta method to solve
% ordinary differential equations of the form dy/dt = F(y, t).
%
% Inputs:
%  - F: Anonymous function defining the ODE dy/dt = F(y, t).
%  - h: Step size.
%  - t0: Initial value of t.
%  - y0: Initial value of y.
%  - tf: Final value of t to be approximated.
%
% Outputs:
%  - tv: Vector of time points.
%  - yv: Vector of approximate solutions corresponding to the time points in tv.

function [tv, yv] = RungeKutta2doOrden(F, h, t0, y0, tf)

  tv = t0:h:tf;
  yv(1) = y0;
  
  for i = 1:length(tv)-1 
      K1 = h * F(yv(i), tv(i)); 
      K2 = h * F(yv(i) + K1, tv(i) + h);
      yv(i+1) = yv(i) + K1/2 + K2/2; 
  end
  
  tv = tv.';
  yv = yv.';

end