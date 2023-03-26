% This function prompts the user to enter the dimensions and elements of a matrix,
% and returns the resulting matrix. It is often used in conjunction with other
% functions that require a matrix as input for calculations.

function mat = lecturamatriz()
  n = input('Ingrese el numero de filas de la matriz: ');
  m = input('Ingrese el numero de columnas de la matriz: ');
  A = zeros(n,m);
  for i=1:n 
      disp(['Elementos de la fila: ', num2str(i)]);
      for j=1:m 
          disp(['Columna: ', num2str(j)]);
          A(i,j) = input('... '); 
      end
  end
  mat = A; 
end