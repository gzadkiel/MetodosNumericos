% This function implements the 4th order Runge-Kutta method for solving
% ordinary differential equations.
%
% InputS:
%  - h: Step size
%  - t0: Initial value of t
%  - y0: Initial value of y
%  - tf: Final value of t to be calculated
%  - F: Function handle to the function dy/dt = F(t, y)
%
% Outputs:
%  - tv: Vector of time values
%  - yv: Vector of corresponding solution values
%  
% Example usage:
% Example usage
% h = 0.1;
% t0 = 0;
% y0 = 1;
% tf = 1;
% F = @(t, y) -y*t; % example function dy/dt = -y*t
% [tv, yv] = RungeKutta4toOrden(h, t0, y0, tf, F);

function [tv, yv] = RungeKutta4toOrden(h, t0, y0, tf, F)

  tv = t0:h:tf;
  yv(1) = y0;
  
  for i = 1:length(tv)-1
      K1 = h*F(tv(i), yv(i));
      K2 = h*F(tv(i) + h/2, yv(i) + K1/2);
      K3 = h*F(tv(i) + h/2, yv(i) + K2/2);
      K4 = h*F(tv(i) + h, yv(i) + K3);
      yv(i+1) = yv(i) + (K1 + 2*K2 + 2*K3 + K4)/6;
  end

end