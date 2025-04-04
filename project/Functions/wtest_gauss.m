% wtest_gauss() performs the Gaussian Whiteness Test to validate the model
%   Inputs:
%     residuals - Vector of residuals
%     m         - Number of autocorrelation lags to test
%     alpha     - Significance level (e.g., 0.05 for 5%)
%   Output:
%     whiteness - Test result: 0 = fail, 1 = passed
%
%   Returns the result of the Gaussian Whiteness Test, which checks if 
%   the residuals are white noise based on their autocorrelation. 

function whiteness = wtest_gauss(residuals,m,alpha)

whiteness = 0;
N = length(residuals);

r = zeros(m,1); % initialization of the autocorrelation function

    for i=1:m+1
        r(i) = ((residuals') * diag(ones(1,N-i+1),1-i) * residuals) / (N-i+1); %computation of the autocorrelation functions up to m 
    end

r_0 = r(1); %variance
gamma = r(2:end) / r_0;

x= sqrt(N) * gamma; %test quantity definition

prob = norminv(1-alpha/2); %inverse of the normal pdf

    if x <= prob
        whiteness = 1;
    end

end
