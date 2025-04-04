%   costFunc() computes the cost function J(theta) for the Least Square Estimate
%   Inputs:
%     y     - Output samples vector
%     theta - Estimated parameters vector
%     H     - Hankel matrix
%     model - Model type ('ARX' or 'FIR')
%   Output:
%     J_theta - The value of the cost function
%
%   Returns the cost function value for the given model ('ARX' or 'FIR') 
%   based on output samples y, parameters vector theta, and the Hankel matrix H

function J_theta = costFunc(y, theta, H, model)
    switch model
        case 'ARX'
            N = length(y); % number of samples
            n = length(theta) / 2; % input/output order
            y_relevant = y(n + 1:end); % portion of y to match H

            % Compute the cost function for the ARX model
            J_theta = (1 / (N - n)) * (y_relevant - H * theta)' * (y_relevant - H * theta);
        
        case 'FIR'
            N = length(y); % number of samples
            n = length(theta); % input/output order
            y_relevant = y(n + 1:end); % portion of y to match H

            % Compute the cost function for the FIR model
            J_theta = (1 / (N - n)) * (y_relevant - H * theta)' * (y_relevant - H * theta);
        
        otherwise
            error('Unknown model type. Supported types are ''ARX'' and ''FIR''');
    end
end
