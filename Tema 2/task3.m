function [A_k S] = task3(image, k)
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
  Z = A' / sqrt(n-1);
  
  % 4
  [U, S, V] = svd(Z);
  
  % 5
  W = V(:, 1:k);
  
  % 6
  Y = W' * A;
  
  % 7
  A_k = W * Y + miu;
endfunction