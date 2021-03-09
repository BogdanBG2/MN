function view_cost_vs_nc(file_points)
	% Citirea matricei de puncte 
  aux = dlmread(file_points, " ", 5, 0);
  P = aux(:, 2:columns(aux));
  
  A = zeros(10,2);
  A(:,1) = 1:10;
  
  % In A(i,2), retinem costul pentru i centroizi
  for i = 1:10
    C = clustering_pc(P, i);
    cost = compute_cost_pc(P, C);
    A(i,2) = cost;
  endfor

  % Trasarea graficului cost = f(i)
  plot(A(:,1), A(:,2));
end

