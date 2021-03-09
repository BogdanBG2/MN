% outputs a graphical representation of the clustering solution
function view_clusters(points, centroids)
	% TODO graphical representation coded here 
  P = points;
  C = centroids;
  
  m = rows(P);
  n = rows(C);
  
  D = zeros(m,n);
  A = zeros(1,m);
    
  for i = 1:m
    for j = 1:n
      D(i,j) = norm(C(j,:) - P(i,:));  
    endfor
  endfor
  
  for i = 1:m
      a = 0; % variabila auxiliara
      b = 0; % indicele distantei minime
      [a, b] = min(D(i,:));
      A(1,i) = b;
    endfor
    
  for i = 1:m
    
    if A(1,i) == 1 % albastru
      scatter3(P(i,1), P(i,2), P(i,3), 30, [0 128 255]/255); hold on;

    elseif A(1,i) == 2 % mov
      scatter3(P(i,1), P(i,2), P(i,3), 30, [159 0 255]/255); hold on;
    
    elseif A(1,i) == 3 % portocaliu
      scatter3(P(i,1), P(i,2), P(i,3), 30, [255 90 0]/255); hold on;
    
    elseif A(1,i) == 4 % verde
      scatter3(P(i,1), P(i,2), P(i,3), 30, [100 192 0]/255); hold on;
    endif
  endfor
endfunction

