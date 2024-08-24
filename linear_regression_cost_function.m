function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  % TODO: linear_regression_cost_function implementation
  m = length(Y); % lungimea lui Y
  FeatureMatrix = [ones(size(FeatureMatrix,1),1) FeatureMatrix];% cazul cu 0
  %aplic formula
  h = FeatureMatrix * Theta;
  diff = h - Y;
  Error = (1 / (2 * m)) * sum(diff .^ 2);
  
  
endfunction