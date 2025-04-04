% residuals() computes the residuals given the dataset and parameter vector
%   Inputs:
%     u         - Input vector samples
%     y         - Output vector samples
%     theta_hat - Estimated parameters vector
%     model     - Model type ('ARX' or 'FIR')
%   Output:
%     epsilon   - Residuals vector
%
%   Returns the residuals for the specified model based on input samples u, 
%   output samples y, and parameter vector theta_hat

function epsilon = residuals(u, y, theta_hat, model)
    switch model
        case 'ARX'
            n = length(theta_hat) / 2; % Input/output order
            Nu = length(u) - n; % Number of input samples (minus the order)
            Ny = length(y) - n; % Number of output samples (minus the order)

            H = myHank(u, y, n, 'ARX'); % Definition of the Hankel matrix H = [-Hy Hu]

            if Nu == Ny
                N = Nu; % Number of samples
                epsilon = zeros(N, 1); % Residuals initialization
                for i = 1:N
                    phi = H(i, :); % Extraction of regressor vector from the Hankel matrix
                    epsilon(i) = y(n + i) - phi * theta_hat; % Residual computation
                end
            else
                error('The dimensions of the input and output vectors are not correct.');
            end

        case 'FIR'
            n = length(theta_hat); % Input/output order
            Nu = length(u) - n; % Number of input samples (minus the order)

            H = myHank(u, y, n, 'FIR'); % Definition of the Hankel matrix H = [Hu]

            N = Nu; % Number of samples
            epsilon = zeros(N, 1); % Residuals initialization
            for i = 1:N
                phi = H(i, :); % Extraction of regressor vector from the Hankel matrix
                epsilon(i) = y(n + i) - phi * theta_hat; % Residual computation
            end
    end
end
