%   errorRate() compute the error rate
%   Input:
%   predictions - vector of predicted labels
%   trueLabels - vector of true labels

function errorRate = errorRate(predictions, trueLabels)
    % Ensure inputs are column vectors
        if isrow(predictions)
            predictions = predictions';
        end
        if isrow(trueLabels)
            trueLabels = trueLabels';
        end
    
    % Calculate the number of incorrect predictions
    numIncorrect = sum(predictions ~= trueLabels);
    
    % Calculate the total number of predictions
    N = length(trueLabels);
    
    % Compute the error rate
    errorRate = numIncorrect / N;
end
