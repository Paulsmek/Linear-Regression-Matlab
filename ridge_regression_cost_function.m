function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: ridge_regression_cost_function implementation
  
  %adaug o linie de 1 pentru a mari matrice pentru a contine cazul cu coeficientul specific 0
  FeatureMatrix = [ones(size(FeatureMatrix,1),1) FeatureMatrix];
  m = size(FeatureMatrix, 1); % liniile matricii
  % calculez termenii pentru ridge_regression
  h = FeatureMatrix * Theta; 
  diff = h - Y;
  A = (1/(2 * m)) * sum(diff .^ 2);
  %termenul specific de regularizare
  B = lambda * sum(Theta(2:end) .^ 2);
  Error = A + B;
endfunction