function centroids = clustering_pc(P, nc)
  format long g
  
  r = rows(P); % rows(P) va fi folosit destul de des in cod
  C1 = []; % multimea centroizilor initiali
  
  % Generarea primilor nc centroizi
  R = randperm(r, nc);
  aux = P(R(1), :);
  for i = 2:nc
    aux = [aux; P(R(i), :)];
  endfor
  C1 = aux;
  
  sem = 1; 
  % sem = 1, daca centroizii obtinuti 
  % difera de cei de la care s-a intrat in while
  % sem = 0, in caz contrar
  
  while sem == 1 % Cat timp se modifica pozitiile centroizilor
    sem = 0;
    
    % Retinerea distantelor de la fiecare punct din P pana la fiecare centroid 
    D = zeros(r, nc);
    for i = 1:r
      for j = 1:nc
        D(i, j) = norm(C1(j,:) - P(i,:));  
      endfor
    endfor
    
    % Retinerea centroidului cel mai apropiat de fiecare punct din P
    A = zeros(1, r);
    for i = 1:r
      [m, q] = min(D(i,:));
      A(1,i) = q; % indicele pe care se afla distanta minima
    endfor
    
    % Cate elemente "orbiteaza" in jurul centroidului #i?
    nr_elem = zeros(1,nc);
    for i = 1:nc
      for j = 1:columns(A)
        if A(1,j) == i
          nr_elem(1,i) += 1;
        endif
      endfor
    endfor
    
    %Calcularea coordonatelor noilor centroizi
    C2 = zeros(rows(C1), columns(C1)); % C2 -> centroizii rezultati
    for i = 1:r
      C2(A(i), :) += P(i,:) / nr_elem(1, A(1,i));
    endfor
    % Se adauga punctul #i la centroidul de care este mai apropiat
    % si impartit la numarul de puncte din jurul centroidului respectiv
    
    if C2 - C1 != zeros(rows(C1), columns(C1)) 
    % Daca centroizii rezultati difera de cei initiali, 
      sem = 1; % mai iteram inca o data (sem = 1),
      C1 = C2; % pornind de la centroizii rezultati   
    endif
  endwhile
  
  centroids = C2;
endfunction