function task5()
  img = './in/images/image1.gif';
  A = double(imread(img));
  [m, n] = size(A);
  X = 1:min(m,n);
  
  Y1 = zeros(1, min(m,n));
  Y2 = Y1;
  Y3 = Y1;
  Y4 = Y1; 
  
  for k = 1:min(m,n)
    [A_k, S] = task3(img, k);
    
    % Graficul #1
    Y1(k) = S(k,k);
    
    % Graficul #2
    Y2(k) = trace(S(1:k,1:k)) / trace(S);
    
    % Graficul #3
    aux = (A - A_k) .^ 2;
    Y3(k) = sum(sum(aux)) / (m*n);
    
    % Graficul #4
    Y4(k) += (2*k + 1) / n;
  endfor

  subplot(2,2,1), plot(X,Y1); title("5.1");
  subplot(2,2,2), plot(X,Y2); title("5.2");
  subplot(2,2,3), plot(X,Y3); title("5.3");
  subplot(2,2,4), plot(X,Y4); title("5.4");
endfunction