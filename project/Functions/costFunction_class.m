%   Logistic regression cost function and gradient
%   Inputs:
%       theta  - Parameters for logistic regression
%       u      - Feature matrix
%       y      - Labels vector    
%   Outputs:
%       J      - Cost function value
%       grad   - Gradient of the cost function with respect to theta

function [J, grad] = costFunction_class(theta, u, y)
    
    m = length(y);
    
    h = sigmoid(u * theta);
    J = (1/m) * (-y' * log(h) - (1 - y)' * log(1 - h));
    
    % Compute the gradient for the cost function
    grad = (1/m) * u' * (h - y);
end
