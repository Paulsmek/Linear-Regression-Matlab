function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

  % TODO: gradient_descent implementation
  Theta = zeros(n + 1,1); % creez Theta
  FeatureMatrix = [zeros(m,1) FeatureMatrix]; % acopar si cazul cu 0
  %aplic formula pentru iter iteratii
  for i= 1:iter
    h = FeatureMatrix * Theta;
    diff = h - Y;
    grad = (1/m) * (FeatureMatrix' * diff);
    Theta = Theta - alpha * grad;
  endfor
endfunction