function [m A eigenfaces pr_img] = eigenface_core(database_path)
  img = zeros(200,200,10);
  T = zeros(40000, 10);
  med = zeros(40000,1);
  
  % Pasul 1
  for i = 1:10
    name = strcat("./", database_path, "/" , num2str(i), ".jpg");
    img(:,:,i) = double(rgb2gray(imread(name)));
    T(:,i) = (img(:,:,i))'(:);
  endfor
  
  % Pasul 2
  for i = 1:40000
    med(i) = mean(T(i,:));
  endfor
  m = med;
  
  % Pasul 3
  A = T - m;
  
  % Pasul 4
  C = A' * A;
  [V_aux, l] = eig(C);
  V = [];
  for i = 1:rows(l)
    if l(i,i) > 1
      V = [V V_aux(:,i)]; 
    endif
  endfor
  
  eigenfaces = zeros(40000, columns(V));
  eigenfaces = A * V;
  
  % Pasul 5
  pr_img = zeros(columns(V), 10);
  pr_img = eigenfaces' * A;
endfunction