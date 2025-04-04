% One-vs-All Multiclass Logistic Regression Training
% Input:
% u - Training data 
% y - Training labels
% num_labels - Number of unique labels/classes
% eta - Learning rate
% num_iters - Number of iterations for gradient descent
% Output:
% all_theta - Matrix where the i-th row is the trained logistic regression parameters for class i

function [all_theta] = oneVsAll_Train(u, y, num_labels, eta, num_iters)

    % Add intercept term to X
    u = [ones(size(u, 1), 1) u];
    
    % Initialize parameters
    [m, n] = size(u);
    all_theta = zeros(num_labels, n);
    
    % Train num_labels logistic regression classifiers
    for c = 1:num_labels
        initial_theta = zeros(n, 1);
        % Set the labels to 1 for the current class and 0 for the others
        yc = (y == c);
        
        % Gradient Descent
        theta = initial_theta;
        for iter = 1:num_iters
            [J, grad] = costFunction_class(theta, u, yc);
            theta = theta - eta * grad;
        end
        all_theta(c, :) = theta';
    end
end
