%   cross_corr_gauss() performs the cross-correlation test using the Gaussian distribution
%   to validate the model
%   Inputs:
%     residuals - Vector of residuals
%     u         - Input vector samples
%     m         - Number of cross-correlation lags to test
%     alpha     - Significance level (e.g., 0.05 for 5%)
%     n         - Input/output order
%   Output:
%     cross_corr - Test result: 0 = fail, 1 = passed
%
%   Returns the result of the cross-correlation test, which checks if 
%   the residuals and the input samples are correlated

function cross_corr = cross_corr_gauss(residuals,u,m,alpha,n)

r_eu = zeros(m,1); % initialization of cross correlation function
phi = u(n+1:end); % input regressor vector
N = length(residuals);

%computation of the two autocorrelation of the input(sigma) and of the residual r_e(0)
re_0 = (residuals'*diag(ones(1,N))*residuals)/N;
ru_0 = var(u); % we know it is a white noise and the autocorrelation at tau = 0 coincides with its variance

%computation of the autocorrelation matrix for m samples
    for i = 1:m
        r_eu = (phi'*residuals)/(N-i+1);
    end

gamma = r_eu/(sqrt(re_0*ru_0)); % test quantity definition

prob = norminv(1-alpha/2); %inverse of the normal pdf

    if gamma <= prob
        cross_corr = 1;
    end

end