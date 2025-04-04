%   LS() computes the Least Squares Estimate for the ARX or FIR model 
%   Inputs:
%     u     - Input samples vector
%     y     - Output samples vector
%     n     - Model order (number of past inputs/outputs to use)
%     model - Model type ('ARX' or 'FIR')
%   Output:
%     theta - The estimated parameters vector
%
%   Returns the estimated parameters vector for the given model ('ARX' or 'FIR') based
%   on input samples u, output samples y, and the model order n

function theta = LS(u, y, n, model)
    switch model
        case 'ARX'
            % Check if u and y have the same length
            if length(u) ~= length(y)
                error("Input and output vectors must have the same length");
            end
            
            % Compute the number of samples
            N = length(u) - n;

            % Ensure the number of samples is positive
            if N <= 0
                error("The length of input/output vectors must be greater than the model order");
            end

            % Construct the Hankel matrix
            H = myHank(u, y, n, model); % H = [-Hy Hu]

            % Extract the relevant portion of the output samples
            y_relevant = y(n + 1:end);

            % Compute the least squares estimate of the parameters
            theta = pinv(H' * H / N) * (H' / N) * y_relevant;

        case 'FIR'
            % Compute the number of samples
            N = length(u) - n;

            % Ensure the number of samples is positive
            if N <= 0
                error("The length of input vector must be greater than the model order");
            end

            % Construct the Hankel matrix 
            H = myHank(u, y, n, model); % H = [Hu]

            % Extract the relevant portion of the output samples
            y_relevant = y(n + 1:end);

            % Compute the least squares estimate of the parameters
            theta = pinv(H' * H / N) * (H' / N) * y_relevant;

        otherwise
            error('Unknown model type. Supported types are ''ARX'' and ''FIR''');
    end
end
