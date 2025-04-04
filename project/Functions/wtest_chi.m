%   wtest_chi() performs the Chi-Square Whiteness Test to validate the model
%   Inputs:
%     residuals - Residuals vector
%     m         - Degree of freedom for the Chi-Square test
%     alpha     - Significance level (e.g., 0.05 for 5%)
%   Output:
%     whiteness - Test result: 0 = fail, 1 = passed
%
%   Returns the result of the Chi-Square Whiteness Test. The test checks 
%   if the residuals are white noise.

function whiteness = wtest_chi(residuals,m,alpha)
whiteness = 0;

N = length(residuals); %Residual Samples

r = zeros(m,1); %initialization of the autocorr fun

% definition of the autocorrelation function
    for i = 1:m+1
        r(i) = (residuals'*diag(ones(1,N-i+1),1-i) * residuals) / (N - i + 1);
    end

r_0 = r(1); % Variance
r = r(2:end); % Autocorrelations for tau = 1,...,m

x = N * ((r' * r) / (r_0^2)); %quantity test
chi2 = chi2inv(1-alpha,m);

if x <= chi2 
	whiteness = 1;
end

end