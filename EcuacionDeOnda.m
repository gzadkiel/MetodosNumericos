% Solves the wave equation numerically using the finite difference method
%
% Inputs:
%  - h: spatial step size
%  - k: time step size
%  - cte: constant parameter in the wave equation
%  - Ti: initial time
%  - Tf: final time
%  - Xi: initial position
%  - Xf: final position
%  - Bi: boundary value at the initial position
%  - Bf: boundary value at the final position
%  - F1: function handle for the initial position condition
%  - F2: function handle for the initial velocity condition
% Output:
%  - O: matrix containing the solution of the wave equation at each time step and position
%
% Example usage:
% O = EcuacionDeOnda(0.1, 0.01, 1, 0, 10, 0, 1, 0, 0, @(x) sin(x), @(x) cos(x))

function O = EcuacionDeOnda(h, k, cte, Ti, Tf, Xi, Xf, Bi, Bf, F1, F2)
  
  % Calculate the parameter r
  r = (cte^2 * k^2) / h^2;
  
  % Create vectors for distance and time steps
  vec_dist = Xi:h:Xf;
  vec_tiem = Ti:k:Tf;
  
  % Initialize the solution matrix
  O = zeros(length(vec_tiem), length(vec_dist));
  
  % Set the initial position values
  for i = 1:length(vec_dist)
      O(1,i) = F1(vec_dist(i));
  end
  
  % Set the boundary values
  for i = 1:length(vec_tiem)
      O(i,1) = Bi;
      O(i,end) = Bf;
  end
  
  % Calculate the solution at time step 2 using the initial velocity condition
  for j = 2:length(vec_dist)-1
      O(2,j) = (r/2) * (O(1,j+1) + O(1,j-1)) + (1-r) * O(1,j) + k * F2(vec_dist(j));
  end
  
  % Calculate the solution for the remaining time steps
  for j = 3:length(vec_tiem)
      for i = 2:length(vec_dist)-1
          O(j,i) = r * (O(j-1,i+1) + O(j-1,i-1)) + 2 * (1-r) * O(j-1,i) - O(j-2,i);
      end
  end
  end
  