%   myHank() constructs Hankel matrices for ARX and FIR models
%   Inputs:
%     u     - Input samples vector
%     y     - Output samples vector (needed for ARX model)
%     n     - Model order 
%     model - Model type ('ARX' or 'FIR')
%   Output:
%     hankel - The resulting Hankel matrix
%
%   Returns the Hankel matrix for the given model ('ARX' or 'FIR') based on
%   input samples u, output samples y, and the model order n

function hankel = myHank(u, y, n, model)
    switch model
        case 'ARX'
            % Check if the length of u and y are sufficient for the given order n
            if length(u) < n || length(y) < n
                error('Input and output vectors must be at least of length n');
            end
            
            % Number of input and output samples
            N_u = length(u); 
            N_y = length(y);
            
            % Initialize Hu and Hy
            Hu = zeros(N_u - n, n);
            Hy = zeros(N_y - n, n);
            
            % Fill Hu with input samples
            for i = 1:n
                Hu(:, n - i + 1) = u(i:N_u - n + i - 1);
            end
            
            % Fill Hy with output samples
            for j = 1:n
                Hy(:, n - j + 1) = y(j:N_y - n + j - 1);
            end
            
            % Hankel matrix
            hankel = [-Hy Hu];

        case 'FIR'
            % Check if the length of u is sufficient for the given order n
            if length(u) < n
                error('Input vector must be at least of length n');
            end
            
            % Number of input samples
            N_u = length(u);
            
            % Initialize Hu
            Hu = zeros(N_u - n, n);
            
            % Fill Hu with input samples
            for i = 1:n
                Hu(:, n - i + 1) = u(i:N_u - n + i - 1);
            end
            
            % The Hankel matrix for FIR model is just Hu
            hankel = Hu;

        otherwise
            error('Unknown model type. Supported types are ''ARX'' and ''FIR''');
    end
end