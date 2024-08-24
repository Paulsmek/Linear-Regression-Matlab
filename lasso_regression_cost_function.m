function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: lasso_regression_cost_function implementation
  FeatureMatrix = [ones(size(FeatureMatrix,1),1) FeatureMatrix];%cazul cu 0
  m = size(FeatureMatrix, 1);%marimea
  %aplic formula
  h = FeatureMatrix * Theta;
  diff = h - Y;
  A = (1/m) * sum(diff .^ 2);
  B = lambda * sum(abs(Theta(2:end)));
  Error = A + B;
endfunction