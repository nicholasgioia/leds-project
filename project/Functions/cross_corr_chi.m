%   cross_corr_chi() performs the cross-correlation test using the chi-square
%   distribution to validate the model
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

function cross_corr = cross_corr_chi(residuals,u,m,alpha,n)

r_eu = zeros(m,1); % initialization of the cross correlation function
phi = u(n+1:end); %definition the regressor vector of the input
N = length(residuals); % residuals length

%computation of the two autocorrelation of the input(sigma) and of the residual r_e(0)

sigma = (phi'*phi)/N;
re_0 = (residuals'*diag(ones(1,N))*residuals)/N;

%computation of the autocorrelation matrix for m samples
    for i = 1:m
        r_eu = (phi'*residuals) / (N-i+1);
    end

x = N * (r_eu * pinv(sigma) * r_eu'/re_0); % definition of the test quantity

chi = chi2inv(1-alpha,m);

    if x <= chi
        cross_corr = 1;
    end

end