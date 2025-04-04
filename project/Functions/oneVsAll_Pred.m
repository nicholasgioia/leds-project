% One-vs-All Multiclass Logistic Regression Prediction
% Input:
% all_theta - Matrix where the i-th row is the trained logistic regression parameters for class i
% u - Test data
% Output:
% y_pred - Predicted labels for test data

function y_pred = oneVsAll_Pred(all_theta, u)
    % Add intercept term to X
    u = [ones(size(u, 1), 1) u];
    
    % Compute the class probabilities for each class on each training instance
    probabilities = sigmoid(u * all_theta');
    
    % Assign each instance to the class with the highest probability
    [~, y_pred] = max(probabilities, [], 2);
end
