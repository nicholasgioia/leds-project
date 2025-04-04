%   AIC() computes the Akaike Information Criterion (AIC) for model order evaluation
%   Inputs:
%     u     - Input samples vector
%     y     - Output samples vector
%     theta - Estimated parameters vector
%     model - Model type ('ARX' or 'FIR')
%   Output:
%     AIC   - The value of the AIC function
%
%   Returns the AIC value for the given model ('ARX' or 'FIR') based on 
%   input samples u, output samples y, and the estimated parameters vector theta
    
function AIC = AIC(u, y, theta, model)
    switch model
        case 'ARX'
            Nu = length(u); % number of input samples
            Ny = length(y); % number of output samples

            if Nu ~= Ny
                error("Input and output vectors must have the same length.");
            end

            p = length(theta); % model order complexity
            n = p / 2; % input/output order
            
            N = Nu;
            H = myHank(u, y, n, model); % Construct the Hankel matrix for ARX model
            
            % Compute the cost function J(theta)
            J_theta = costFunc(y, theta, H, model);
            
            % Compute the AIC value
            AIC = N * log(J_theta) + 2 * p;

        case 'FIR'
            Nu = length(u); % number of input samples
            Ny = length(y); % number of output samples

            if Nu ~= Ny
                error("Input and output vectors must have the same length");
            end

            p = length(theta); % model order complexity
            n = p; % input/output order
            
            N = Nu;
            H = myHank(u, y, n, model); % Construct the Hankel matrix for FIR model
            
            % Compute the cost function J(theta)
            J_theta = costFunc(y, theta, H, model);
            
            % Compute the AIC value
            AIC = N * log(J_theta) + 2 * p;

        otherwise
            error('Unknown model type. Supported types are ''ARX'' and ''FIR''');
    end
end
