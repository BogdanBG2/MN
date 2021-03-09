% computes a clustering solution total cost
function cost = compute_cost_pc(points, centroids)
  format long g
  
	P = points;
  C = centroids;
  
  cost = 0; 
  
  p = rows(P);
  c = rows(C);
  
  D = zeros(p,c);
  for i = 1:p
    for j = 1:c
      D(i,j) = norm(P(i,:) - C(j,:));
    endfor
  endfor
  
  % Calcularea costului
  for i = 1:p
    s = min(D(i,:));
    cost += s;
  endfor
endfunction