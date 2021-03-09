function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  T = zeros(40000, 1);
  d = zeros(1, columns(A));
  
  % Pasul 6
  img = double(rgb2gray(imread(image_path)));
    
    % Pasul 6.1
  T(:,1) = img'(:);
  
    % Pasul 6.3
  A2 = T - m;
  
  % Pasul 7
  pr_test_img = eigenfaces' * A2;

  % Pasul 8
  for i = 1:columns(A)
    d(i) = norm(pr_test_img - pr_img(:,i)); 
  endfor
  
  [min_dist, output_img_index] = min(d);
endfunction