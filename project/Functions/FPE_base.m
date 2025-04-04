%   FPE_BASE Computes the Final Prediction Error (FPE) criterion for model order evaluation
%   Inputs:
%     u     - Input samples vector
%     y     - Output samples vector
%     theta - Estimated parameters vector
%     model - Model type ('ARX' or 'FIR')
%   Output:
%     FPE   - The value of the FPE function
%
%   Returns the FPE value for the given model ('ARX' or 'FIR') based on
%   input samples u, output samples y, and the estimated parameters vector theta

function FPE = FPE_base(u, y, theta, model)
    switch model
        case 'ARX'
            Nu = length(u); % number of input samples
            Ny = length(y); % number of output samples

            if Nu ~= Ny
                error("Input and output vectors must have the same length");
            end

            n = length(theta) / 2;
            p = 2 * n;

            N = Nu;

            % Construct the Hankel matrix for the ARX model
            H = myHank(u, y, n, model);

            % Compute the cost function J(theta)
            J_theta = costFunc(y, theta, H, model);

            % Compute the FPE value
            FPE = J_theta * (N + p) / (N - p);

        case 'FIR'
            Nu = length(u); % number of input samples
            Ny = length(y); % number of output samples

            if Nu ~= Ny
                error("Input and output vectors must have the same length");
            end

            n = length(theta);
            p = n;

            N = Nu;

            % Construct the Hankel matrix for the FIR model
            H = myHank(u, y, n, model);

            % Compute the cost function J(theta)
            J_theta = costFunc(y, theta, H, model);

            % Compute the FPE value
            FPE = J_theta * (N + p) / (N - p);

        otherwise
            error('Unknown model type. Supported types are ''ARX'' and ''FIR''');
    end
end
