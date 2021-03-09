function [A_k S] = task4(image, k)
  % 1
  A = double(imread(image));
  [m, n] = size(A);
  miu = zeros(m,1);
  
  for i = 1:m
    miu(i) = mean(A(i,:));
  
	% 2
    A(i,:) -= miu(i);
  endfor
  
  % 3
  Z = 1/(n-1) * A * A';
  
  % 4
  [V, S] = eig(Z);
  
  % 5
  W = V(:, 1:k); % coloanele de la 1 la k ale lui V
  
  % 6
  B = W';
  Y = B * A;
  
  % 7
  A_k = W * Y + miu;
endfunction