function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights
  
  % TODO: normal_equation implementation
  %FeatureMatrix = [ones(size(FeatureMatrix,1),1) FeatureMatrix];
  n = size(FeatureMatrix,2); % marimea FeatureMatrix
  % aplic algoritmul de normal_equation cu ajutorul gradientului conjugat
  A = FeatureMatrix' * FeatureMatrix;
  b = FeatureMatrix' * Y;
  if all(eig(A) > 0)%verific daca matricea e pozitiv definita
  x_0 = zeros(n,1);
  r_0 = b - A* x_0;
  v_1 = r_0;
  x = x_0;
  tolsquared= tol ^ 2;
  k = 1;
  %aplic algoritmul pana am toleranta dorita sau am depasit incercarile(iter)
  while k < iter && r_0' * r_0 > tolsquared
    t_k =  r_0' * r_0 / (v_1' * A * v_1);
    x = x + t_k * v_1;
    r_k = r_0 - t_k * A * v_1;
    s_k = r_k' * r_k / (r_0' *  r_0);
    v_k_1 = r_k + s_k * v_1;
    
    r_0 = r_k;
    v_1 = v_k_1;
    k = k + 1;
    
  endwhile
  
  Theta = x;
  Theta = [zeros(1,1); Theta];%adaug cazul de 0
 else
  Theta = zeros(n + 1,1);%daca matricea nu e pozitiv definita solutia e 0 peste tot
  
  endif
endfunction